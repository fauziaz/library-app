import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  final List<Map<String, String>> favoriteBooks = const [
    {'title': 'GetX Simplified', 'author': 'John Code'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorit Saya')),
      body: ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              title: Text(
                book['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('by ${book['author']}'),
              trailing: const Icon(Icons.favorite, color: Colors.redAccent),
              onTap: () {
                Get.toNamed('/book-details', arguments: book);
              },
            ),
          );
        },
      ),
    );
  }
}