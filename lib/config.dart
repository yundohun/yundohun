library config.globals;

import 'package:firebase_auth/firebase_auth.dart';

bool get isSignIn => FirebaseAuth.instance.currentUser != null;

List<String> photoPickerList = ['사진 찍기', '사진 보관함'];
List<String> procStatList = ['요청중', '진행중', '완료됨', '취소됨'];
List<String> clmList = ['거래취소 요청', '비매너 신고', '고객센터 연결'];
