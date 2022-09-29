import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/bg.dart';
import 'package:streetvendor/loginpage.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => mainpage()));
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
                'assets/img1.jpg',
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
