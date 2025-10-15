import 'package:flutter/material.dart';
import 'package:toko_roti_online/models/db_helper.dart';

class EditCourierPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  const EditCourierPage({super.key, required this.userData});

  @override
  State<EditCourierPage> createState() => EditCourierPageState();
}

class EditCourierPageState extends State<EditCourierPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late String _selectedRole; // Tetap digunakan untuk update
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.userData['email']);
    _passwordController = TextEditingController(text: widget.userData['password']);
    _nameController = TextEditingController(text: widget.userData['name']);
    _selectedRole = widget.userData['role']; // Tetap disimpan
  }

  Future<void> _updateUser() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String name = _nameController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      setState(() => _errorText = 'Semua field harus diisi!');
      return;
    }

    await DBHelper().updateUser(
      widget.userData['id'],
      email,
      password,
      name,
      _selectedRole, // Tetap dikirim ke database
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil diperbarui')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Kurir'), backgroundColor: Colors.brown),
      backgroundColor: const Color(0xFFFFF8E7),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          
            // Field Role dihapus dari tampilan
            if (_errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(_errorText!, style: const TextStyle(color: Colors.red)),
              ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _updateUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Simpan Perubahan', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
