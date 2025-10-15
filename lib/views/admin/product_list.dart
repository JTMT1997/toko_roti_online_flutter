import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toko_roti_online/models/database_helper.dart';
import 'package:toko_roti_online/models/product.dart';
import 'package:toko_roti_online/views/admin/product_form.dart';
import 'package:toko_roti_online/views/admin/product_list.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _products = [];

  Future<void> _loadProducts() async {
    final db = DatabaseHelper();
    final products = await db.getProducts();
    setState(() {
      _products = products;
    });
  }

  Future<void> _deleteProduct(int id) async {
    final db = DatabaseHelper();
    await db.deleteProduct(id);
    await _loadProducts();
  }

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final p = _products[index];
          return ListTile(
            leading: Image.file(File(p.imagePath), width: 50, height: 50, fit: BoxFit.cover),
            title: Text(p.name),
            subtitle: Text('Rp ${p.price}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteProduct(p.id!),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProductForm(product: p)),
            ).then((_) => _loadProducts()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductForm()),
        ).then((_) => _loadProducts()),
      ),
    );
  }
}