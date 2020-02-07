import 'package:calc_training/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "シンプルすぎる計算脳トレ",
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
