import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

import 'package:streetvendor/storage_page.dart';

import 'maindrawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //

//

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: maindrawer(),
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    onPressed: () async {
                      final results = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          allowedExtensions: ['png', 'jpg'],
                          type: FileType.custom);
                      if (results == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(' no img selected')),
                        );
                        return null;
                      }
                      final path = results.files.single.path!;
                      final fileName = results.files.single.name;
                      print(path);
                      print(fileName);
                      storage
                          .uploadFile(path, fileName)
                          .then((value) => print('done'));
                    },
                    child: Icon(Icons.camera)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
