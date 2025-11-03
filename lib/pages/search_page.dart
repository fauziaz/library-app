import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  final List<Map<String, String>> searchResults = const [
    {'title': 'Flutter for Beginners', 'author': 'Dev Smith'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Buku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan judul buku...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              enabled: false, 
            ),
            const SizedBox(height: 20),

            const Text(
              'Hasil Pencarian:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final book = searchResults[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    child: ListTile(
                      title: Text(book['title']!),
                      subtitle: Text('by ${book['author']}'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Get.toNamed('/book-details', arguments: book);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}