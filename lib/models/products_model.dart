import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:toko_roti_online/models/item_model.dart';

class ProductsModel {
  static final ProductsModel instance = ProductsModel._init();
  static Database? _database;

  ProductsModel._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('items.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
   

    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        item_id INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        FOREIGN KEY (item_id) REFERENCES items(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        total REAL NOT NULL,
        date TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE order_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        order_id INTEGER NOT NULL,
        item_id INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        FOREIGN KEY (order_id) REFERENCES orders(id),
        FOREIGN KEY (item_id) REFERENCES items(id)
      )
    ''');
  }

  // ===================== ITEM =====================
  Future<int> insertItem(Item item) async {
    final db = await instance.database;
    return await db.insert('items', item.toMap());
  }

  Future<List<Item>> getItems() async {
    final db = await instance.database;
    final result = await db.query('items');
    return result.map((map) => Item.fromMap(map)).toList();
  }

  Future<int> updateItem(Item item) async {
    final db = await instance.database;
    return await db.update('items', item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<int> deleteItem(int id) async {
    final db = await instance.database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  // ===================== CART =====================
  Future<int> addToCart(int itemId, int quantity) async {
    final db = await instance.database;
    return await db.insert('cart', {
      'item_id': itemId,
      'quantity': quantity,
    });
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await instance.database;
    return await db.rawQuery('''
      SELECT cart.id, cart.item_id, cart.quantity, items.title, items.description, items.imagePath
      FROM cart
      JOIN items ON cart.item_id = items.id
    ''');
  }

  Future<int> updateCartItem(int cartId, int quantity) async {
    final db = await instance.database;
    return await db.update('cart', {'quantity': quantity}, where: 'id = ?', whereArgs: [cartId]);
  }

  Future<int> deleteCartItem(int cartId) async {
    final db = await instance.database;
    return await db.delete('cart', where: 'id = ?', whereArgs: [cartId]);
  }

  Future<void> clearCart() async {
    final db = await instance.database;
    await db.delete('cart');
  }

  // ===================== CHECKOUT =====================
  Future<int> checkoutCart() async {
  final db = await instance.database;
  final cartItems = await getCartItems();

  double total = 0;
  for (var item in cartItems) {
    final itemData = await db.query(
      'items',
      where: 'id = ?',
      whereArgs: [item['item_id']],
    );

    // Pastikan price dan quantity bertipe numerik
    final priceRaw = itemData.first['price'];
    final quantityRaw = item['quantity'];

    final price = (priceRaw is num) ? priceRaw.toDouble() : double.tryParse(priceRaw.toString()) ?? 0.0;
    final quantity = (quantityRaw is int) ? quantityRaw : int.tryParse(quantityRaw.toString()) ?? 0;

    total += price * quantity;
  }

  final orderId = await db.insert('orders', {
    'total': total,
    'date': DateTime.now().toIso8601String(),
  });

  for (var item in cartItems) {
    await db.insert('order_items', {
      'order_id': orderId,
      'item_id': item['item_id'],
      'quantity': item['quantity'],
    });
  }

  await clearCart();
  return orderId;
}


  // ===================== ORDER HISTORY =====================
  Future<List<Map<String, dynamic>>> getOrderHistory() async {
    final db = await instance.database;
    return await db.query('orders', orderBy: 'date DESC');
  }

  Future<List<Map<String, dynamic>>> getOrderDetails(int orderId) async {
    final db = await instance.database;
    return await db.rawQuery('''
      SELECT order_items.quantity, items.title, items.imagePath
      FROM order_items
      JOIN items ON order_items.item_id = items.id
      WHERE order_items.order_id = ?
    ''', [orderId]);
  }
}
