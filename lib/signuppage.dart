import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/splash.dart';
import 'dart:ui';

class signup extends StatefulWidget {
  final VoidCallback showLoginPage;
  const signup({super.key, required this.showLoginPage});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _name = TextEditingController();
  final _shopname = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _cnfmpass = TextEditingController();
  Future signup() async {
    if (passcontrol()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _pass.text.trim(),
      );

      addUser(
        _email.text.trim(),
        _name.text.trim(),
        _shopname.text.trim(),
        _pass.text.trim(),
      );
    }
  }

  Future addUser(
      String Name, String Shopname, String Email, String Password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name': Name,
      'Shop Name': Shopname,
      'Email': Email,
      'Password': Password
    });
  }

  bool passcontrol() {
    if (_pass.text.trim() == _cnfmpass.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _name.dispose();
    _shopname.dispose();
    _pass.dispose();
    _cnfmpass.dispose();
    super.dispose();
  }

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
            child: Container(
              decoration: BoxDecoration(boxShadow: []),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                sigmaX: 30.0,
                                sigmaY: 30.0,
                              ),
                              child: Container(
                                height: 600,
                                width: 370,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      width: 1.5,
                                      color: Colors.white.withOpacity(0.5),
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
                                        controller: _name,
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            hintText: 'Name',
                                            icon: Icon(
                                              Icons.person_sharp,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.7))),
                                      ),
                                    ),
                                    // ---------------------------
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: TextField(
                                        controller: _shopname,
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            hintText: 'Shop Name',
                                            icon: Icon(
                                              Icons.home_outlined,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.7))),
                                      ),
                                    ),
                                    // ---------------------------
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: TextField(
                                        controller: _email,
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
                                    // ---------------------------
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: TextField(
                                        controller: _pass,
                                        obscureText: true,
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
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: TextField(
                                        controller: _cnfmpass,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            hintText: 'Confirm Password',
                                            icon: Icon(
                                              Icons.check_circle_outline,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.7))),
                                      ),
                                    ),
                                    SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 90.0),
                                      child: GestureDetector(
                                        onTap: signup,
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: Center(
                                            child: Text(
                                              'Sign Up >',
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already a member..?..',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white
                                                  .withOpacity(0.7)),
                                        ),
                                        GestureDetector(
                                          onTap: widget.showLoginPage,
                                          child: Text(
                                            'Sign in',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 113, 82, 235),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                              )),
                        ),
                      ]),
                ),
              ),
            )));
  }
}
