import 'package:flutter/material.dart';
import 'screens/basic_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Form App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BasicInfoScreen(), // Set the starting screen
    );
  }
}
  