import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toko_roti_online/models/db_helper.dart';
import 'package:toko_roti_online/routes/app-routes.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorText;

  Future<void> _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() => _errorText = 'Isi email dan password!');
      return;
    }

    final user = await DBHelper().loginUser(username, password);

    if (user != null) {
      final role = user['role'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login sebagai $role')),
      );

      switch (role) {
        case 'admin':
          Navigator.pushReplacementNamed(context, AppRoutes.adminDashboard);
          break;
        case 'kurir':
          Navigator.pushReplacementNamed(context, AppRoutes.coureirDashboard);
          break;
        default:
          Navigator.pushReplacementNamed(context, AppRoutes.products);
      }
    } else {
      setState(() => _errorText = 'Login gagal. Cek kembali email dan password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bakery_dining, size: 80, color: Colors.brown),
              const SizedBox(height: 8),
              const Text(
                "Toko Roti Online",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.person, color: Colors.brown),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: Colors.brown),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                obscureText: true,
              ),

              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    _errorText!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.register);
                },
                child: const Text(
                  "Belum punya akun? Daftar di sini",
                  style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text("Pengaduan : Hubungi 08xxxx", style: GoogleFonts.lato(color: Colors.brown, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
