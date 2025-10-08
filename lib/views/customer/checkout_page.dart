import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Alamat Pengiriman (Otomatis GPS)"),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey,
            child: Text("Lokasi : 00.00.2222"),
          ),
          Spacer(),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.orderStatus);
          }, child: Text("Kirim pesanan"))
        ],
      ),),
    );
  }
}