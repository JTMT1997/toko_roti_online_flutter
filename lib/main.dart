import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';
import 'package:toko_roti_online/views/admin/admin_dashboard_page.dart';
import 'package:toko_roti_online/views/admin/admin_products_page.dart';
import 'package:toko_roti_online/views/customer/login_page.dart';
import 'package:toko_roti_online/views/customer/splash_screen.dart';

void main(List<String> args) {
  runApp(const TokoRotiApps());
}

class TokoRotiApps extends StatelessWidget {
  const TokoRotiApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toko ROti Online",
      debugShowCheckedModeBanner: !true,
      theme: ThemeData(primarySwatch: Colors.brown),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes
      // home:  SplashScreen(),
    );
  }
}
