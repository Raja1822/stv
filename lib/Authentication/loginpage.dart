import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/Authentication/forgetpasspage.dart';
import 'package:streetvendor/custom&validation/colors.dart';
import 'package:streetvendor/custom&validation/custom_text_field.dart';
import 'package:streetvendor/custom&validation/validation_util.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _email = TextEditingController();
  //final _pass = TextEditingController();

  bool _isPasswordVisible = false;

  String _password = "";
  String _email = "";

  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _password = _passwordController.text.trim();
        });
      });
    _emailController = TextEditingController()
      ..addListener(() {
        setState(() {
          _email = _emailController.text.trim();
        });
      });
  }

  bool _isPasswordValid({bool skipEmpty = true}) =>
      _password.length >= 8 || (skipEmpty && _password.isEmpty);

  bool _isEmailValid({bool skipEmpty = true}) =>
      ValidationUtil.isValidEmail(_email) || (skipEmpty && _email.isEmpty);

  bool get _isFormValid =>
      _isPasswordValid(skipEmpty: false) && _isEmailValid(skipEmpty: false);

  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
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
                                child: CustomTextField(
                                    placeholder: "Email",
                                    valid: _isEmailValid(),
                                    errorText: "Invalid email",
                                    controller: _emailController,
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      color: themeColorDarkest,
                                    )),
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: CustomTextField(
                                  controller: _passwordController,
                                  valid: _isPasswordValid(),
                                  errorText:
                                      "Password must of of at-least of 8 characters",
                                  hideText: !_isPasswordVisible,
                                  suffixIcon: IconButton(
                                      onPressed: _toggleVisibility,
                                      icon: Icon(_isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined)),
                                  placeholder: "Password",
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: themeColorDarkest,
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
                                          style: TextStyle(color: Colors.white),
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
                                          color:
                                              Color.fromARGB(255, 113, 82, 235),
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
    );
  }
}

/*
*/
                     