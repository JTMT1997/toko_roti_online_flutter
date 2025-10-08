import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class CourierDashboardPage extends StatelessWidget {
  const CourierDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Dashboar Kurir"),),
      backgroundColor: Colors.amberAccent,
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.local_shipping, color: Colors.amber,), 
            title: Text("Daftar Pengirim"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.coureirDashboard);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2, color: Colors.amber,), 
            title: Text("Profil Kurir"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.coureirDashboard);
            },
          )
        ],
      ),
    );
  }
}