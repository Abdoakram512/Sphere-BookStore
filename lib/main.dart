import 'package:flutter/material.dart';
import 'package:sphere_book_app/core/theme/app_theme.dart';

void main() {
  runApp(const SphereBookApp());
}

class SphereBookApp extends StatelessWidget {
  const SphereBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sphere Book App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(body: Center(child: Text('Sphere Book App'))),
    );
  }
}
