import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lookup/core/model/closet_info.dart';
import 'package:lookup/core/service/closet_api.dart';
import 'package:lookup/core/service/storage_api.dart';

import '../model/storage_info.dart';

class ClosetCtrl extends GetxController {
  final ClosetApi _closetApi = ClosetApi.to;
  final StorageApi _storageApi = StorageApi.to;

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchClosetLst(
          String uid, String typ) =>
      _closetApi.fetchColData(uid, typ);

  Future<List<StorageInfo?>?> uploadMultiFiles(
          String path, List<Uint8List> dataLst) async =>
      await _storageApi.uploadFiles(path, dataLst);

  Future<void> addCloset(String uid, String typ, ClosetInfo info) async =>
      await _closetApi.addDoc(uid, typ, info.toMap());

  List<ClosetInfo> _closetInfoLst = [];
  List<ClosetInfo> get closetInfoLst => _closetInfoLst;
  set closetInfoLst(List<ClosetInfo> value) {
    _closetInfoLst = value;
    update();
  }

  static ClosetCtrl get to => Get.find();
}
