import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toko_roti_online/models/database_helper.dart';
import 'package:toko_roti_online/models/product.dart';
import 'package:toko_roti_online/models/purchase.dart';
import 'package:toko_roti_online/models/transaction_helper.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _products = [];

  Future<void> _loadProducts() async {
    final db = TransactionHelper();
    final products = await db.getProducts();
    setState(() {
      _products = products;
    });
  }

  Future<void> _buyProduct(Product p) async {
    final db = TransactionHelper();
    final purchase = Purchase(
      productId: p.id!,
      productName: p.name,
      price: p.price,
      imagePath: p.imagePath,
    );
    await db.insertPurchase(purchase);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Berhasil membeli ${p.name}')),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Toko Roti'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          icon: Icon(Icons.logout),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.purchaseList);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _products.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final p = _products[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(p.imagePath),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rp ${p.price}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () => _buyProduct(p),
                                  child: Text('Beli'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
