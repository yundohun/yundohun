import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../help/fire_path.dart';

class ClosetApi extends GetxController {
  static ClosetApi get to => Get.find();

  final CollectionReference _ref =
      FirebaseFirestore.instance.collection(FirePath.closetFirePath);

  Future<DocumentReference<Object?>> addDoc(
          String uid, String typ, Map<String, dynamic> data) =>
      _ref.doc(uid).collection(typ).add(data);

  Future<void> addDocById(
          String uid, String typ, String id, Map<String, dynamic> data) =>
      _ref.doc(uid).collection(typ).doc(id).set(data);

  Future<void> deleteDoc(String uid, String typ, String id) =>
      _ref.doc(uid).collection(typ).doc(id).delete();

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchColData(
          String uid, String typ) =>
      _ref.doc(uid).collection(typ).snapshots();

  Stream<DocumentSnapshot<Map<String, dynamic>>> fetchDocById(
          String uid, String typ, String id) =>
      _ref.doc(uid).collection(typ).doc(id).snapshots();

  Future<QuerySnapshot<Map<String, dynamic>>> getColData(
          String uid, String typ) =>
      _ref.doc(uid).collection(typ).get();

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocById(
          String uid, String typ, String id) =>
      _ref.doc(uid).collection(typ).doc(id).get();

  Future<void> updateDoc(
          String uid, String typ, String id, Map<String, dynamic> data) =>
      _ref.doc(uid).collection(typ).doc(id).update(data);
}
