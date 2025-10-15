import 'package:flutter/material.dart';

import 'package:toko_roti_online/models/db_helper.dart';

import 'package:toko_roti_online/views/admin/edit_customer_page.dart';


class ManageCustomerPage extends StatefulWidget {
  const ManageCustomerPage({super.key});

  @override
  State<ManageCustomerPage> createState() => _ManageCustomerPageState();
}

class _ManageCustomerPageState extends State<ManageCustomerPage> {
  List<Map<String, dynamic>> _users = [];

  Future<void> _loadUsers() async {
    final allUsers = await DBHelper().getAllUsers();

    // Filter: hanya tampilkan user dengan role 'customer'
    final filtered = allUsers.where((user) => user['role'] == 'customer').toList();

    setState(() => _users = filtered);
  }

  Future<void> _deleteUser(int id) async {
    await DBHelper().deleteUser(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengguna berhasil dihapus')),
    );
    _loadUsers();
  }

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Customer'),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: const Color(0xFFFFF8E7),
      body: _users.isEmpty
          ? const Center(child: Text('Belum ada data customer'))
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.brown),
                    title: Text(user['name']),
                    subtitle: Text('${user['email']} • ${user['role']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.brown),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditCustomerPage(userData: user),
                              ),
                            );
                            _loadUsers();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Konfirmasi'),
                                content: const Text('Yakin ingin menghapus customer ini?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _deleteUser(user['id']);
                                    },
                                    child: const Text('Hapus', style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}