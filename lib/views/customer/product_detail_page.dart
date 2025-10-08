import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final products   =ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    
    return  Scaffold(
      appBar:AppBar(
        title:  Text(products['Nama'].toString()),),
        body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rp. ${products['Price'].toString()}"),
          Row(children: [
            IconButton(onPressed: (){
                if (quantity >1) setState(()=>quantity--);         
            }, icon: Icon(Icons.remove)),
                Text(quantity.toString()),
                IconButton(
                  onPressed: () => {setState(() => quantity++)},
                  icon: const Icon(Icons.add),
                ),
             
          ],),
          const Spacer(),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,AppRoutes.cart);
          }, child: const Text("Tambah ke Keranjang"),),
        ],
      ),), 
    );
  }
}