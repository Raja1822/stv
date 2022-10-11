import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebase_storage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgname) async {
    if (imgname == null) {
      return null;
    }
    try {
      var urlRef = firebase_storage
          .child("images")
          .child('${imgname.toLowerCase()}.png');

      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
