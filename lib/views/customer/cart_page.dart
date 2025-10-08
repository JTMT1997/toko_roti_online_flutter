import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Column(
        children: [
          Expanded(child: 
          ListView(
            children: [
              ListTile(title: Text("Roti Tawar - 2 pcs"),),
              ListTile(title: Text("Roti Bakar - 2 pcs"),), 
            ],
            
          )
        ),
        Divider(),
        Padding(padding: const EdgeInsets.all(20),
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, AppRoutes.checkout);
        }, child: Text("Checkout")),)
        ]
      ),
    );
  }
}