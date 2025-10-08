import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageCourrierPage extends StatelessWidget {
  const ManageCourrierPage({super.key});

  @override



  Widget build(BuildContext context) {
    final couriers = [
      {"Nama" : "Budi", "Status" : "Aktif"},
      {"Nama" : "Ahmad", "Status" : "Nonaktif"},
      {"Nama" : "Joko", "Status" : "Aktif"}
    ];
    return  Scaffold(
      appBar: AppBar(title: Text(""),backgroundColor: Colors.grey,),
      body: ListView.builder(
        itemCount: couriers.length,
        itemBuilder: (context, index) {
          final courier = couriers[index];
          return ListTile(
            leading: Icon(Icons.delivery_dining, color: Colors.cyan,),

            title: Text(courier['Nama']!, style: GoogleFonts.fahkwang(),),
            subtitle: Text("Status: ${courier['Status']}", style: GoogleFonts.abrilFatface(),),
            trailing: Icon(Icons.more_vert),

          );
        },
      ),
    );
  }
}