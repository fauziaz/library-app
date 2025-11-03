import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthorDetailsPage extends StatelessWidget {
  const AuthorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final author = Get.arguments as String?;

    final Map<String, Map<String, String>> authorData = {
      'Jane Dev': {
        'birth': '12 Maret 1990',
        'nationality': 'Amerika Serikat',
        'bio':
            'Jane Dev adalah penulis dan pengembang Flutter yang berpengalaman. '
                'Ia banyak menulis tentang UI/UX modern dan implementasi state management.',
      },
      'John Code': {
        'birth': '5 September 1987',
        'nationality': 'Inggris',
        'bio':
            'John Code dikenal sebagai pengembang software dan instruktur Flutter. '
                'Ia fokus pada arsitektur aplikasi dan penggunaan GetX secara efisien.',
      },
      'Alex Logic': {
        'birth': '22 Juli 1992',
        'nationality': 'Kanada',
        'bio':
            'Alex Logic adalah programmer dan penulis buku tentang bahasa Dart. '
                'Karyanya banyak membantu pengembang memahami konsep OOP dan null safety.',
      },
    };

    final details = authorData[author] ??
        {
          'birth': 'Tidak diketahui',
          'nationality': 'Tidak diketahui',
          'bio':
              'Informasi mengenai penulis ini belum tersedia dalam database kami.',
        };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Penulis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              author ?? 'Tidak Diketahui',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Text(
                  'Tanggal Lahir: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  details['birth']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                const Text(
                  'Kebangsaan: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  details['nationality']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 1),

            const Text(
              'Tentang Penulis:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              details['bio']!,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}