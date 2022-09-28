import 'package:flutter/material.dart';
import 'package:streetvendor/registerShop.dart';
import 'package:streetvendor/splash.dart';
import 'dart:ui';

class signup extends StatelessWidget {
  const signup({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 16,
                      spreadRadius: 16,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ]),
                  child: Center(
                    child: Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 40.0,
                              sigmaY: 40.0,
                            ),
                            child: Container(
                              height: 550,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.white.withOpacity(0.7),
                                  )),
                              child: Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Name',
                                          icon: Icon(
                                            Icons.person,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          hintStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Phone',
                                          icon: Icon(
                                            Icons.phone,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7))),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Address',
                                          icon: Icon(
                                            Icons.home,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7))),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Email',
                                          icon: Icon(
                                            Icons.email,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7))),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Password',
                                          icon: Icon(
                                            Icons.lock,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.7))),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 110),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()),
                                            );
                                          },
                                          child: Text(
                                            'NEXT',
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontSize: 20,
                                            ),
                                          ),
                                        )),
                                      )),
                                ],
                              )),
                            )),
                      ),
                    ]),
                  ),
                ))));
  }
}
