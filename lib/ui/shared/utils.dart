import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class Utils {
  static Future<List<Uint8List>?> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "취소",
          doneButtonTitle: "저장",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#ffffff",
          actionBarTitle: "옷장 등록",
          actionBarTitleColor: "#191919",
          allViewTitle: "모든 사진",
          useDetailsView: false,
          selectCircleStrokeColor: "#5C6EDA",
        ),
      );
      List<Uint8List> tmpList = [];

      for (var result in resultList) {
        tmpList
            .add((await result.getByteData(quality: 10)).buffer.asUint8List());
      }

      return tmpList;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}