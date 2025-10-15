import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toko_roti_online/models/database_helper.dart';
import 'package:toko_roti_online/models/purchase.dart';
import 'package:toko_roti_online/models/transaction_helper.dart';

class TransactionListPage extends StatefulWidget {
  @override
  State<TransactionListPage> createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  List<Purchase> _purchases = [];

  Future<void> _loadPurchases() async {
    final db = TransactionHelper();
    final purchases = await db.getPurchases();
    setState(() {
      _purchases = purchases;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPurchases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Pembelian')),
      body: _purchases.isEmpty
          ? Center(child: Text('Belum ada pembelian.'))
          : ListView.builder(
              itemCount: _purchases.length,
              itemBuilder: (context, index) {
                final p = _purchases[index];
                return ListTile(
                  leading: Image.file(
                    File(p.imagePath),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(p.productName),
                  subtitle: Text('Rp ${p.price}'),
                );
              },
            ),
    );
  }
}
