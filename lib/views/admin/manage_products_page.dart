import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProductsPage extends StatefulWidget {
  const ManageProductsPage({super.key});

  @override
  State<ManageProductsPage> createState() => _ManageProductsPageState();
}

class _ManageProductsPageState extends State<ManageProductsPage> {
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Roti Tawar',
      'price': 10000,
      'image': 'assets/images/roti_keju.png',
    },
    {
      'name': 'Roti Coklat',
      'price': 12000,
      'image': 'assets/images/roti_coklat.png',
    },
    {
      'name': 'Roti Keju',
      'price': 15000,
      'image': 'assets/images/roti_tawar.png',
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  void _showAddProductDialog() {
    _nameController.clear();
    _priceController.clear();
    _imageController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title:  Text(
            'Tambah Produk',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration:  InputDecoration(labelText: 'Nama Produk'),style: GoogleFonts.lato(),
              ),
              TextField(
                controller: _priceController,
                decoration:  InputDecoration(labelText: 'Harga Produk'),style: GoogleFonts.b612Mono(),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _imageController,
                decoration:  InputDecoration(
                  labelText: 'Path Gambar (opsional)',
                  hintText: 'contoh: assets/images/roti_baru.png',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:  Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _priceController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Nama dan harga wajib diisi")),
                  );
                  return;
                }

                setState(() {
                  _products.add({
                    'name': _nameController.text,
                    'price': int.tryParse(_priceController.text) ?? 0,
                    'image':
                        _imageController.text.isNotEmpty
                            ? _imageController.text
                            : 'assets/images/roti_tawar.png',
                  });
                });

                Navigator.pop(context);
              },
              child:  Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title:  Text("Hapus Produk"),
            content: Text(
              "Apakah Anda yakin ingin menghapus ${_products[index]['name']}?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child:  Text("Batal"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _products.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child:  Text("Hapus"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E7),
      appBar: AppBar(
        title:  Text('Kelola Produk', style: GoogleFonts.lato(),),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.brown,
        icon:  Icon(Icons.add),
        label:  Text("Tambah Produk"),
        onPressed: _showAddProductDialog,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child:
            _products.isEmpty
                ?  Center(
                  child: Text(
                    "Belum ada produk",
                    style: TextStyle(color: Colors.brown, fontSize: 16),
                  ),
                )
                : ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final item = _products[index];

                    return Card(
                      margin:  EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        contentPadding:  EdgeInsets.all(12),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            (item['image'] as String?) ??
                                'assets/images/roti_tawar.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          item['name'].toString(),
                          style:  GoogleFonts.b612Mono(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.brown,
                          
                          ),
                        ),
                        subtitle: Padding(
                          padding:  EdgeInsets.only(top: 4.0),
                          child: Text(
                            "Rp ${item['price']}",
                            style:  GoogleFonts.b612Mono(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon:  Icon(
                            Icons.delete,
                            color: Colors.limeAccent,
                          ),
                          tooltip: "Hapus Produk",
                          onPressed: () => _deleteProduct(index),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
