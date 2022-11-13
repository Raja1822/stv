import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streetvendor/Pages/homepage.dart';
import 'package:streetvendor/Pages/storage_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

Future save() async {
  addData(
    _title.text.trim(),
    _quantity.text.trim(),
    _price.text.trim(),
  );
}

final _title = TextEditingController();
final _quantity = TextEditingController();
final _price = TextEditingController();

final user = FirebaseAuth.instance.currentUser?.email;

Future addData(String Title, String Quantity, String Price) async {
  await FirebaseFirestore.instance.collection('savedData/').add({
    'Title': Title,
    'Quantity': Quantity,
    'Price': Price,
  });
}

class _SavePageState extends State<SavePage> {
  File? pickedImage;
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
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
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Pic Image From",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        pickImage(ImageSource.camera);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //------------------gallery
                    GestureDetector(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Gallery',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //-------------------
                    SizedBox(
                      height: 20,
                    ),
                    //------------cancel
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //-----------
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      final name = photo.name;
      final path = photo.path;
      storage.uploadFile(path, name);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _title.dispose();
    _quantity.dispose();
    _price.dispose();

    super.dispose();
  }

  final Storage storage = Storage();
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
            child: SingleChildScrollView(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                              width: 3),
                                        ),
                                        child: GestureDetector(
                                          onTap: imagePickerOption,
                                          child: ClipRect(
                                            child: pickedImage != null
                                                ? Image.file(pickedImage!,
                                                    width: 170,
                                                    height: 170,
                                                    fit: BoxFit.cover)
                                                : Image.network(
                                                    'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                                    width: 170,
                                                    height: 170,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 40),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: TextField(
                                    controller: _title,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
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
                                    controller: _quantity,
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
                                    controller: _price,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
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
                                        GestureDetector(
                                          onTap: () {
                                            save();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
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
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()));
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
      ),
    );
  }
}
