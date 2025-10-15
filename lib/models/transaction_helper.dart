import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'product.dart';
import 'purchase.dart';

class TransactionHelper {
  static final TransactionHelper _instance = TransactionHelper._internal();
  factory TransactionHelper() => _instance;
  TransactionHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'roti.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price INTEGER,
            imagePath TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE purchases(
           id INTEGER PRIMARY KEY AUTOINCREMENT,
    productId INTEGER,
    productName TEXT,
    price INTEGER,
    imagePath TEXT,
    quantity INTEGER,
    totalPrice INTEGER
          )
        ''');
      },
    );
  }

  // Produk
  Future<List<Product>> getProducts() async {
    final db = await database;
    final result = await db.query('products');
    return result.map((map) => Product.fromMap(map)).toList();
  }

  // Pembelian
  Future<void> insertPurchase(Purchase purchase) async {
    final db = await database;
    await db.insert('purchases', purchase.toMap());
  }

  Future<List<Purchase>> getPurchases() async {
    final db = await database;
    final result = await db.query('purchases');
    return result.map((map) => Purchase.fromMap(map)).toList();
  }
}
