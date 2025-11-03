import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_books/main.dart';

void main() {
  testWidgets('LibraryPage displays and navigates correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Library'), findsOneWidget);

    expect(find.text('Cari Buku'), findsOneWidget);
    expect(find.text('Favorit'), findsOneWidget);

    await tester.tap(find.text('Cari Buku'));
    await tester.pumpAndSettle(); 
    expect(find.text('Halaman Pencarian Buku'), findsOneWidget);

    Get.back();
    await tester.pumpAndSettle();
    expect(find.text('Library'), findsOneWidget);

    await tester.tap(find.text('Favorit'));
    await tester.pumpAndSettle();
    expect(find.text('Halaman Favorit Buku'), findsOneWidget);
  });

  testWidgets('Clicking a book navigates to BookDetailsPage', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('Flutter for Beginners'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Buku: Flutter for Beginners'), findsOneWidget);

    await tester.tap(find.text('Lihat Penulis'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Penulis: Author of Flutter for Beginners'), findsOneWidget);
  });
}