import 'package:flutter/material.dart';
import 'package:flutter_application_1/container.dart';

void main() {
  const List<Color> colors = [Colors.purple, Colors.blue];
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors),
      ),
    ),
  );
}
