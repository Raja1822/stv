import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streetvendor/Authentication/authpage.dart';
import 'package:streetvendor/Pages/homepage.dart';

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
