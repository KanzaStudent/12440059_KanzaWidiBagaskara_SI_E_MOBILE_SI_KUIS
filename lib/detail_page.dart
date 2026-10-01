import 'package:flutter/material.dart';

import 'stationery_item.dart';

class DetailPage extends StatefulWidget {
  final StationeryItem item;
  const DetailPage({super.key, required this.item});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final TextEditingController _qtyController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late int _qty;
  late String _describtion;
  late int _harga;

  @override
  void initState() {
    super.initState();
    _harga = widget.item.price;
    _qty = widget.item.stock;
    _describtion = widget.item.description;
    _qtyController = TextEditingController(text: _qty.toString());
    _descriptionController = TextEditingController(text: _describtion);
    _priceController = TextEditingController(text: _harga.toString());
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(item.imageUrl, height: 200, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(
            item.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rp ${formatPrice(_harga)} / pcs',
            style: const TextStyle(color: Colors.green),
          ),
          const SizedBox(height: 8),
          Text(item.description),
          const SizedBox(height: 16),
          TextField(
            controller: _qtyController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'stock tersedia (pcs)',
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => _qty = int.tryParse(v) ?? 0),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => widget.item.description = v),
          ),
          TextField(
            controller: _priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Harga',
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => widget.item.price = int.tryParse(v) ?? 0),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total'),
              Text(
                'Rp ${formatPrice(_qty * _harga)}',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

    
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(context, _qty);
            },
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Simpan Pemesanan'),
          ),
        ],
      ),
    );
  }
}
