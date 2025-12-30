import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ShantiSthapnaApp());
}

class ShantiSthapnaApp extends StatelessWidget {
  const ShantiSthapnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shanti Sthapna Mission',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF00D494),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
