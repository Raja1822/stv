import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/mainPage.dart';
import 'package:streetvendor/homepage.dart';

class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/stv1.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 30,
              ),
              CupertinoActivityIndicator(
                color: Colors.white,
                radius: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
