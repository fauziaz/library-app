import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/library_page.dart';
import 'pages/book_details_page.dart';
import 'pages/author_details_page.dart';
import 'pages/search_page.dart';
import 'pages/favorites_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/library',
      getPages: [
        GetPage(name: '/library', page: () => LibraryPage()),
        GetPage(name: '/book-details', page: () => BookDetailsPage()),
        GetPage(name: '/author-details', page: () => AuthorDetailsPage()),
        GetPage(name: '/search', page: () => SearchPage()),
        GetPage(name: '/favorites', page: () => FavoritesPage()),
      ],
    );
  }
}
