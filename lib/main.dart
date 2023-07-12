import 'package:flutter/material.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const FinalProject());
}

class FinalProject extends StatelessWidget {
  const FinalProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
