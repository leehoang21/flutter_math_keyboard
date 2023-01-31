import 'package:flutter/material.dart';
import 'package:flutter_math_keyboard/bloc/math_keyboard_controller.dart';
import 'package:flutter_math_keyboard/view/math_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math key board',
      home: Scaffold(
        body: MathField(
          controller: MathKeyboardController(),
        ),
      ),
    );
  }
}
