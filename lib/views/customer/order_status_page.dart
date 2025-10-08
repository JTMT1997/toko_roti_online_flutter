import 'package:flutter/material.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final status = ["pending","Dikirim","Selesai"];
    return  Scaffold(
      appBar:AppBar(title: Text("Status Order Page"),),
      body: ListView.builder(
        itemCount: status.length,
        itemBuilder: (context, index) => ListTile(
          title: Text("Pesanan ${index +1}"),
          subtitle: Text("Status : ${status[index]}"),
        ),
      ),
    );
  }
}