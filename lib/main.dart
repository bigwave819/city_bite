import 'package:cityfood/pages/login_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SpashPage());
}

class SpashPage extends StatelessWidget {
  const SpashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}