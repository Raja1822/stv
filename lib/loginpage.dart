import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/forgetpasspage.dart';
import 'package:streetvendor/signuppage.dart';
import 'package:streetvendor/splash.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _pass.text.trim());
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 54.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 30.0,
                            sigmaY: 30.0,
                          ),
                          child: Container(
                            height: 500,
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
                                  child: Form(
                                    key: formkey,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: _email,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                                  0.7))),
                                              icon: Icon(
                                                Icons.mail_outline_outlined,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                              ),
                                              labelText: "Email",
                                              labelStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.7))),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: _pass,
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                                  0.7))),
                                              icon: Icon(
                                                Icons.lock,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                              ),
                                              labelText: "Password",
                                              labelStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.7))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // ---------------------------

                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        forgetpage()));
                                          },
                                          child: Text(
                                            'Forget password.?',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 90.0),
                                  child: GestureDetector(
                                    onTap: signin,
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Center(
                                        child: Text(
                                          'Sign In >',
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'New member..?..',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                    GestureDetector(
                                      onTap: widget.showRegisterPage,
                                      child: Text(
                                        'Sign Up',
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
*/
                     