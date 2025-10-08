import 'package:flutter/material.dart';

class ManageOrdersPage extends StatelessWidget  {
  const ManageOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {'id': 'ORD001', 'customer': 'Asih', 'status': 'Pending'},
      {'id': 'ORD002', 'customer': 'Nopriadi', 'status': 'Dikirim'},
      {'id': 'ORD003', 'customer': 'Keyla', 'status': 'Selesai'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Kelola Pesanan')),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text('Pesanan ${order['id']}'),
              subtitle: Text('Customer: ${order['customer']}'),
              trailing: Text(order['status']!),
              onTap: (){},
            ),
          );
        },
        )
    );
  }
}