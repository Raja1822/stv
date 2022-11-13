import 'package:flutter/material.dart';

import 'maindrawer.dart';

class contacts extends StatelessWidget {
  const contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text('Contacts'),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: maindrawer(),
      ),
      body: Container(
        child: Container(
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
      ),
    );
  }
}
