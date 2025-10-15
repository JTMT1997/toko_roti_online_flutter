import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toko_roti_online/models/database_helper.dart';
import 'package:toko_roti_online/models/product.dart';
import 'dart:io';

class ProductForm extends StatefulWidget {
  final Product? product;
  const ProductForm({this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _nameController.text = widget.product!.name;
      _priceController.text = widget.product!.price.toString();
      _imageFile = File(widget.product!.imagePath);
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  Future<void> _saveProduct() async {
    final name = _nameController.text;
    final price = int.tryParse(_priceController.text) ?? 0;
    final imagePath = _imageFile?.path ?? '';

    final product = Product(
      id: widget.product?.id,
      name: name,
      price: price,
      imagePath: imagePath,
    );

    final db = DatabaseHelper();
    if (widget.product == null) {
      await db.insertProduct(product);
    } else {
      await db.updateProduct(product);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product == null ? 'Tambah Produk' : 'Edit Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nama')),
            TextField(controller: _priceController, decoration: InputDecoration(labelText: 'Harga'), keyboardType: TextInputType.number),
            SizedBox(height: 10),
            _imageFile != null
                ? Image.file(_imageFile!, height: 150)
                : Text('Belum ada gambar'),
            ElevatedButton(onPressed: _pickImage, child: Text('Pilih Gambar')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProduct, child: Text('Simpan')),
          ],
        ),
      ),
    );
  }
}