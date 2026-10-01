import 'package:flutter/material.dart';
import 'stationery_item.dart';

class HomePage extends StatelessWidget {
  final List<StationeryItem> items;
  final void Function(StationeryItem) onTapItem;
  const HomePage({super.key, required this.items, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko alat tulis'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 127, 147),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () => onTapItem(item),
              child: Row(
                children: [
                  Image.network(item.imageUrl, width: 100, height: 100, fit: BoxFit.cover),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${item.stock} item',
                                      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.w600)),
                                  Text('Rp ${item.formattedPrice} / item',
                                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                                ],
                              ),
                              Text('Rp ${(item.stock * item.price).toStringAsFixed(0)}',
                                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
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