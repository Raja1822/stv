import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:streetvendor/maindrawer.dart';
import 'package:streetvendor/storage_page.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final img = firebase_storage.DownloadTask;
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
              SizedBox(height: 30),
              ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 40.0,
                      sigmaY: 40.0,
                    ),
                    child: Container(
                      height: 600,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 30,
                          ),
                          Image.network("$img"),
                          Column(
                            children: [
                              SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Title',
                                      icon: Icon(
                                        Icons.title_sharp,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      hintStyle: TextStyle(
                                          color:
                                              Colors.white.withOpacity(0.5))),
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
                                        color: Colors.white,
                                      )),
                                      hintText: 'Quantity',
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      hintStyle: TextStyle(
                                          color:
                                              Colors.white.withOpacity(0.5))),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Price',
                                      icon: Icon(
                                        Icons.currency_rupee_outlined,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      hintStyle: TextStyle(
                                          color:
                                              Colors.white.withOpacity(0.5))),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'SAVE',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        maindrawer()));
                                          },
                                          child: Text("Back"))
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
