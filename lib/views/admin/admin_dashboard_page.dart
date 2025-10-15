import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: [
            _menuCard(context, "Kelola Produk", Icons.cake, () {
              _navigateWithLoading(context, AppRoutes.adminProducts);
            }),
            _menuCard(context, "Kelola Pesanan", Icons.shopping_cart_checkout_sharp, () {
              _navigateWithLoading(context, AppRoutes.adminOrders);
            }),
            _menuCard(context, "Data Kurir", Icons.delivery_dining, () {
              _navigateWithLoading(context, AppRoutes.adminCouriers);
            }),
            _menuCard(context, "Profil Admin", Icons.person, () {
              _navigateWithLoading(context, AppRoutes.adminProfil);
            }),
             _menuCard(context, "Data Customer", Icons.people, () {
              _navigateWithLoading(context, AppRoutes.adminUser);
            }),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.amberAccent,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.brown),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateWithLoading(BuildContext context, String routeName) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: SpinKitCircle(
          color: Colors.yellowAccent,
          size: 50.0,
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close the dialog
      Navigator.pushNamed(context, routeName);
    });
  }
}