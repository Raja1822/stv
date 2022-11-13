import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/custom&validation/colors.dart';
import 'package:streetvendor/custom&validation/custom_text_field.dart';
import 'package:streetvendor/custom&validation/validation_util.dart';
import 'dart:ui';

class signup extends StatefulWidget {
  final VoidCallback showLoginPage;
  const signup({super.key, required this.showLoginPage});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  //final _name = TextEditingController();
  //final _shopname = TextEditingController();
  //final _email = TextEditingController();
  //final _pass = TextEditingController();
  //final _cnfmpass = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _username = "";
  String _password = "";
  String _email = "";
  String _confirmPassword = "";

  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController()
      ..addListener(() {
        setState(() {
          _username = _usernameController.text.trim();
        });
      });
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
    _confirmPasswordController = TextEditingController()
      ..addListener(() {
        setState(() {
          _confirmPassword = _confirmPasswordController.text.trim();
        });
      });
  }

  bool _isUsernameValid({bool skipEmpty = true}) =>
      _username.length >= 3 || (skipEmpty && _username.isEmpty);

  bool _isPasswordValid({bool skipEmpty = true}) =>
      _password.length >= 8 || (skipEmpty && _password.isEmpty);

  bool _isConfirmPasswordValid({bool skipEmpty = true}) =>
      _confirmPassword == _password || (skipEmpty && _confirmPassword.isEmpty);

  bool _isEmailValid({bool skipEmpty = true}) =>
      ValidationUtil.isValidEmail(_email) || (skipEmpty && _email.isEmpty);

  bool get _isFormValid =>
      _isUsernameValid(skipEmpty: false) &&
      _isPasswordValid(skipEmpty: false) &&
      _isConfirmPasswordValid(skipEmpty: false) &&
      _isEmailValid(skipEmpty: false);

  Future signup() async {
    if (passcontrol()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      addUser(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUser(String userName, String Email, String Password) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'Name': userName, 'Email': Email, 'Password': Password});
  }

  bool passcontrol() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _usernameController.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
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
                                      child: CustomTextField(
                                          placeholder: "Username",
                                          controller: _usernameController,
                                          valid: _isUsernameValid(),
                                          errorText: "Invalid username",
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: themeColorDarkest,
                                          )),
                                    ),
                                    // ---------------------------
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
                                    // ---------------------------

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
                                                : Icons
                                                    .visibility_off_outlined)),
                                        placeholder: "Password",
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: themeColorDarkest,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                      child: CustomTextField(
                                        controller: _confirmPasswordController,
                                        hideText: !_isConfirmPasswordVisible,
                                        valid: _isConfirmPasswordValid(),
                                        errorText: "Must match the password",
                                        suffixIcon: IconButton(
                                            onPressed:
                                                _toggleConfirmPasswordVisibility,
                                            icon: Icon(_isConfirmPasswordVisible
                                                ? Icons.visibility_outlined
                                                : Icons
                                                    .visibility_off_outlined)),
                                        placeholder: "Confirm Password",
                                        prefixIcon: const Icon(
                                          Icons.key,
                                          color: themeColorDarkest,
                                        ),
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
