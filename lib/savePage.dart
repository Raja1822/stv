import 'dart:io';
import 'package:streetvendor/storage_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:streetvendor/maindrawer.dart';
import 'package:streetvendor/storage_page.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
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
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
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
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
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
                                            final path = pickedImage!.path;
                                            final filename =
                                                pickedImage!.path.camelCase;
                                            storage.uploadFile(path, filename!);
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
      ),
    );
  }
}
