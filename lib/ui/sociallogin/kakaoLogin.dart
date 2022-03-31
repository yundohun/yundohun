import 'package:flutter/material.dart';
import './kakao_login_with_firebase_auto_login.dart';
import './only_kakao_login.dart';



class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  /// 단순 카카오 로그인 (웹뷰)
                  OnlyKakaoLogin(),

                  SizedBox(height: 10),

                  /// Firebase 정보저장 및 자동로그인이 적용된 카카오 로그인 (웹뷰)
                  KakaoLoginWithFirebaseAutoLogin(),
                ],
              ),
            )
        )
    );
  }
}