import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();


  
}

class _SplashScreenState extends State<SplashScreen> {
    void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  } 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bakery_dining, size: 100, color: Colors.grey[200],),
            SizedBox(height: 20,),
            Text("Toko Roti Online",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}