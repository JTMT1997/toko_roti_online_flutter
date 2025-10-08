import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProductsPage extends StatefulWidget {
  const ManageProductsPage({super.key});

  @override
  State<ManageProductsPage> createState() => _ManageProductsPageState();
}

class _ManageProductsPageState extends State<ManageProductsPage> {
  @override
  Widget build(BuildContext context) {
    final products = [
      {"Nama" : "Roti kering", "Price ": 2000},
      {"Nama" : "Roti kering", "Price ": 2000},
      {"Nama" : "Roti kering", "Price ": 2000},
    ];
   
    return  Scaffold(
            
      
      appBar: AppBar(title: Text("Kelola Produk", style: GoogleFonts.lato(),),),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
      backgroundColor: Colors.brown,child: Icon(Icons.add),
      
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ListTile(
            leading: Icon(Icons.cookie),
            title: Text(item['Nama'].toString(), style: GoogleFonts.b612Mono(),),
            subtitle: Text("RP. ${item['Price']}"),
            trailing: Icon(Icons.edit),
            onTap: (){
                
            },
          );
        },
      ),
    );
  }
}