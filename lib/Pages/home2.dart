import 'dart:ui';

import 'package:flutter/material.dart';

class home2 extends StatelessWidget {
  const home2({super.key});

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
                Color(0xffc51c6b),
                Color(0xffbc6c97),
                Color(0xff3f6fdf),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                child: Center(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        icon: Icon(Icons.search),
                      ),
                    ),
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white.withOpacity(0.2),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Lets Explore',
                style: (TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 24,
                        spreadRadius: 16,
                        color: Colors.black.withOpacity(0.2),
                      )
                    ]),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 40.0,
                            sigmaY: 40.0,
                          ),
                          child: Container(
                              height: 200,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.white.withOpacity(0.2),
                                  )),
                              child: Row(children: <Widget>[
                                SizedBox(
                                  width: 30,
                                ),
                                Image.asset(
                                  'assets/img1.jpg',
                                  height: 150,
                                  width: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 60),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Title',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Quantity',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          'Price',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ])),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 40.0,
                        sigmaY: 40.0,
                      ),
                      child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.2),
                              )),
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                              'assets/img1.jpg',
                              height: 150,
                              width: 150,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Title',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ])),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 40.0,
                        sigmaY: 40.0,
                      ),
                      child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.2),
                              )),
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Image.asset(
                              'assets/img1.jpg',
                              height: 150,
                              width: 150,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Title',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Quantity',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ])),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
