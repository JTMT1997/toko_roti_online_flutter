import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class ProductListPage extends StatelessWidget {


  @override
    ProductListPage({super.key});
  final products = [
   { "Nama" : "Roti Tawar", "Price": 1000},
   { "Nama" : "Roti Cokelat", "Price": 1000},
   { "Nama" : "Roti Pisang", "Price": 1000}

  ];
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Daftar Menu Roti ", style: TextStyle(color: Colors.lightGreenAccent),
      ),),
      body: ListView.builder(itemCount: products.length,
            itemBuilder: (context, index){
              final item = products[index];
              return ListTile(
                  title: Text(item['Nama'].toString(),),
                  subtitle: Text("Rp. ${item['Price']}"),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.productDetail,
                    arguments: item);
                  },
              );
            } ,),
    );
    }
    
    }