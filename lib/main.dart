import 'package:flutter/material.dart';
import 'package:racionais_mc/views/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       
        body: HomeView(),
      ),
    );
  }
}