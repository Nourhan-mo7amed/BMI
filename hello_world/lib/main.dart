import 'package:flutter/material.dart';
import 'package:hello_world/screens/Result.dart';
import 'package:hello_world/screens/home.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BMIScreen(),
    );
  }
}
