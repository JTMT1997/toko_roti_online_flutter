import 'package:flutter/material.dart';
import 'package:toko_roti_online/routes/app-routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrasi Akun"),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: "username"),),
            TextField(decoration: const InputDecoration(labelText: "Email"),),
            TextField(decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context,AppRoutes.login);
            }, child: const Text("Daftar"))
          ],
        ),),
    );
  }
}