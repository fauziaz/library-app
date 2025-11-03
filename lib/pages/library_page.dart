import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  final List<Map<String, String>> books = const [
    {'title': 'The Flutter Journey', 'author': 'Jane Dev'},
    {'title': 'GetX Simplified', 'author': 'John Code'},
    {'title': 'Mastering Dart', 'author': 'Alex Logic'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              ),
              icon: const Icon(Icons.search, size: 18, color: Colors.white),
              label: const Text(
                'Cari Buku',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              onPressed: () => Get.toNamed('/search'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              ),
              icon: const Icon(Icons.favorite, size: 18, color: Colors.white),
              label: const Text(
                'Favorit',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              onPressed: () => Get.toNamed('/favorites'),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              title: Text(book['title']!),
              subtitle: Text('by ${book['author']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Get.toNamed('/book-details', arguments: book),
            ),
          );
        },
      ),
    );
  }
}