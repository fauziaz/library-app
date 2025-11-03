import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> book = Get.arguments ?? {};

    final Map<String, Map<String, String>> bookDetails = {
      'The Flutter Journey': {
        'year': '2023',
        'genre': 'Programming / Mobile Development',
        'description':
            'Buku ini membahas perjalanan dalam memahami Flutter. Mulai dari dasar widget, layout, hingga state management modern.',
      },
      'GetX Simplified': {
        'year': '2022',
        'genre': 'Programming / State Management',
        'description':
            'Panduan lengkap memahami GetX dengan cara sederhana dan praktis. Dilengkapi contoh kasus aplikasi nyata.',
      },
      'Mastering Dart': {
        'year': '2021',
        'genre': 'Programming / Language',
        'description':
            'Pelajari bahasa Dart secara mendalam, mulai dari sintaks dasar, null safety, OOP, hingga functional programming.',
      },
    };

    final selectedBook = bookDetails[book['title']] ??
        {
          'year': 'N/A',
          'genre': 'Unknown',
          'description': 'Detail buku tidak ditemukan.',
        };

    return Scaffold(
      appBar: AppBar(
        title: Text(book['title'] ?? 'Detail Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Penulis: ${book['author'] ?? 'Tidak Diketahui'}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () =>
                      Get.toNamed('/author-details', arguments: book['author']),
                  icon: const Icon(Icons.person, size: 18),
                  label: const Text('Lihat Penulis'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(height: 30, thickness: 1),

            Row(
              children: [
                const Text(
                  'Tahun Terbit: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  selectedBook['year']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text(
                  'Genre: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  child: Text(
                    selectedBook['genre']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi Buku:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  selectedBook['description']!,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}