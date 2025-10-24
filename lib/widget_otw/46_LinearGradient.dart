import 'package:flutter/material.dart';

class LinearGradientPage extends StatefulWidget {
  const LinearGradientPage({super.key});

  @override
  State<LinearGradientPage> createState() => _LinearGradientState();
}

class _LinearGradientState extends State<LinearGradientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("45. LinearGradient"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple, Colors.green, Colors.yellow],
            stops: [0.2, 0.5, 0.65, 0.85],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            transform: GradientRotation(3.14 / 4),
          )),
        ),
      ),
    );
  }
}
