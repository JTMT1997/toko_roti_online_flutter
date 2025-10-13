import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class AdminProfilPage extends StatelessWidget {
  const AdminProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Profil Admin", style: GoogleFonts.vampiroOne(),),
      backgroundColor: Colors.yellowAccent,
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //foto profil
            CircleAvatar(
              
              radius: 40,
              backgroundImage: AssetImage('assets/images/foto_jeremy.jpg'),
            ),
            SizedBox(height: 15,),
            Text("Admin Toko Roti", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text("admin@tokoroti.com", style: TextStyle(color: Colors.grey, ), ),
            SizedBox(height: 20,),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: ListTile(
                leading: Icon(Icons.shop_2, color: Colors.blueGrey,),
                title: Text("Nama Toko"),
                subtitle: Text("PbTokoRoti"),
              ),
            ),
                        Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: ListTile(
                leading: Icon(Icons.timer, color: Colors.blueGrey,),
                title: Text("Jam Buka "),
                subtitle: Text("08.00 - 21.00"),
              ),
            ),
            SizedBox(height: 20,),
              Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.blueGrey,),
                title: Text("Nomor Handphone"),
                subtitle: Text("+62451648416"),
              ),
            ),
            SizedBox(height: 20,),
              Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: ListTile(
                leading: Icon(Icons.add_location, color: Colors.blueGrey,),
                title: Text("Lokasi "),
                subtitle: Text("Jakarta, Indonesia"),
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellowAccent,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: (){

              },
              icon: Icon(Icons.edit),
              label: Text("Edit PRofil"),
            ),
            SizedBox(height: 10,),
            OutlinedButton.icon(
            onPressed: (){
              Navigator.pushReplacementNamed(context,AppRoutes.login);

            },style: OutlinedButton.styleFrom(
              foregroundColor: Colors.yellow,
              side: BorderSide(color: Colors.amberAccent),
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            icon: Icon(Icons.logout),
            label: Text("Logout"),
            ),
          ],
        ),
      ),
    );
    
  }
}