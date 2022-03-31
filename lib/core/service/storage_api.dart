import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/storage_info.dart';

class StorageApi extends GetxController {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<StorageInfo?> uploadFile(String path, Uint8List data) async {
    String url = '';
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      url = path + '/' + fileName;
      Reference ref = _storage.ref(url);
      await ref.putData(data);
      return StorageInfo(
          url: await ref.getDownloadURL(),
          path: path,
          nm: fileName,
          fullPath: path + '/' + fileName);
    } catch (e) {
      return null;
    }
  }

  Future<List<StorageInfo?>?> uploadFiles(
      String path, List<Uint8List> dataLst) async {
    var rspFileLst =
        await Future.wait(dataLst.map((data) => uploadFile(path, data)));
    for (var rspFile in rspFileLst) {
      if (rspFile == null) return null;
    }
    return rspFileLst;
  }

  Future deleteFile(String path) async {
    try {
      if (path.isNotEmpty) {
        Reference ref = _storage.ref(path);
        await ref.delete();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static StorageApi get to => Get.find();
}
