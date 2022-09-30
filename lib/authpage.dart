import 'package:flutter/material.dart';
import 'package:streetvendor/loginpage.dart';
import 'package:streetvendor/signuppage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglescreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: togglescreens);
    } else {
      return signup(showLoginPage: togglescreens);
    }
  }
}
