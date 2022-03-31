import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:lookup/config.dart';
import 'package:lookup/core/controller/closet_ctrl.dart';
import 'package:lookup/core/help/fire_path.dart';
import 'package:lookup/core/model/closet_info.dart';
import 'package:lookup/core/model/storage_info.dart';
import 'package:lookup/ui/shared/size.dart';
import 'package:lookup/ui/shared/type.dart';
import 'package:lookup/ui/shared/utils.dart';
import 'package:lookup/ui/widget/card_img.dart';
import 'package:lookup/ui/widget/loading.dart';
import 'package:lookup/ui/widget/tab_item.dart';
import 'package:flutter/material.dart';

class Closet extends StatefulWidget {
  const Closet({Key? key}) : super(key: key);

  @override
  State<Closet> createState() => _ClosetState();
}

class _ClosetState extends State<Closet> {
  late ClosetCtrl _ctrl;
  ClosetTyp _typ = ClosetTyp.outer;
  bool _uploading = false;

  @override
  void initState() {
    _ctrl = ClosetCtrl.to;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              '옷장',
              style: TextStyle(
                  color: Color(0xff191919), fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () => _onClickClosetImg(),
                  icon: Icon(Icons.add_box_outlined)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildTap(),
                h(20),
                _buildClosetLst(),
              ],
            ),
          ),
        ),
        if (_uploading) Loading(barrier: true),
      ],
    );
  }

  _buildTap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TabItem(
            onChanged: (value) => _onClickTab(value),
            caption: '아우터',
            value: ClosetTyp.outer,
            groupValue: _typ),
        TabItem(
            onChanged: (value) => _onClickTab(value),
            caption: '상의',
            value: ClosetTyp.top,
            groupValue: _typ),
        TabItem(
            onChanged: (value) => _onClickTab(value),
            caption: '하의',
            value: ClosetTyp.pants,
            groupValue: _typ),
        TabItem(
            onChanged: (value) => _onClickTab(value),
            caption: '신발',
            value: ClosetTyp.shoes,
            groupValue: _typ),
        TabItem(
            onChanged: (value) => _onClickTab(value),
            caption: 'ACC',
            value: ClosetTyp.acc,
            groupValue: _typ),
      ],
    );
  }

  _buildClosetLst() {
    if (FirebaseAuth.instance.currentUser != null) {
      return StreamBuilder<QuerySnapshot>(
        stream: _ctrl.fetchClosetLst(
            FirebaseAuth.instance.currentUser!.uid, _getTypPath()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ClosetInfo> closetInfoLst = snapshot.data?.docs
                    .map<ClosetInfo>((doc) => ClosetInfo.fromMap(
                        doc.id, doc.data() as Map<String, dynamic>))
                    .toList() ??
                [];
            if (closetInfoLst.isNotEmpty) {
              return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 3,
                staggeredTileBuilder: (int i) => const StaggeredTile.fit(1),
                itemCount: closetInfoLst.length,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                itemBuilder: (context, index) =>
                    CardImg(url: closetInfoLst[index].url),
              );
            } else {
              return _buildEmpty();
            }
          } else {
            return Loading();
          }
        },
      );
    } else {
      return Center(child: Text('로그인을 해주세요'));
    }
  }

  _buildEmpty() => Column(
        children: [
          IconButton(
              onPressed: () => _onClickClosetImg(),
              icon: Icon(Icons.add_photo_alternate_rounded),
              iconSize: 150),
          Text('옷장을 등록해 주세요.'),
        ],
      );

  _onClickTab(Object typ) => setState(() => _typ = typ as ClosetTyp);

  _onClickClosetImg() async {
    if (!isSignIn) {
      Get.defaultDialog(title: '정보', middleText: '로그인을 해주세요');
      return;
    }
    try {
      setState(() => _uploading = true);
      List<Uint8List>? imgByteLst = await Utils.loadAssets();

      if (imgByteLst != null) {
        ///////// 이미지 업로드 로직 Start ///////////
        List<StorageInfo?>? infoLst = await _ctrl.uploadMultiFiles(
            FirePath.getClosetImgPath(
                FirebaseAuth.instance.currentUser!.uid, _getTypPath()),
            imgByteLst);
        ///////// 이미지 업로드 로직 End ///////////

        ///////// 옷장 추가 로직 Start ///////////
        List<ClosetInfo> closetInfoLst = [];
        if (infoLst != null) {
          for (StorageInfo? item in infoLst) {
            item!;
            closetInfoLst.add(ClosetInfo(
                url: item.url,
                path: item.path,
                nm: item.nm,
                fullPath: item.fullPath));
          }
          await Future.wait(closetInfoLst.map((data) => _ctrl.addCloset(
              FirebaseAuth.instance.currentUser!.uid, _getTypPath(), data)));
        }
        ///////// 옷장 추가 로직 End ///////////
      }
    } catch (e) {
      Get.defaultDialog(title: '에러', middleText: e.toString());
    } finally {
      setState(() => _uploading = false);
    }
  }

  _getTypPath() {
    if (_typ == ClosetTyp.outer) {
      return 'outer';
    } else if (_typ == ClosetTyp.top) {
      return 'top';
    } else if (_typ == ClosetTyp.pants) {
      return 'pants';
    } else if (_typ == ClosetTyp.shoes) {
      return 'shoes';
    } else if (_typ == ClosetTyp.acc) {
      return 'acc';
    }
  }
}
