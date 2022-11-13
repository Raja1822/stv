import 'package:flutter/material.dart';

class CustomBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFFc51c6b),
              Color(0xFFbc6c97),
              Color(0xFF3f6fdf),
            ])),
      ),
    );
  }
}
