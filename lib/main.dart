import 'package:flutter/material.dart';
import 'package:top_filmes/ui/pages/movies_page.dart';
import 'package:top_filmes/ui/resorces/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: Strings.appName,
      home: MoviesPage(),
    );
  }
}
