

import 'package:flutter/material.dart';
import '/ui/shared/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lookup/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lookup/main.dart';
//카카오import

import 'package:lookup/ui/sociallogin/kakaoLogin.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:lookup/ui/current_user.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';







final auth = FirebaseAuth.instance;

void signinfirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,



  );

  KakaoSdk.init(nativeAppKey: '6a43005cb3ecbeceed352bf8cd172b06');
  runApp(MaterialApp(
    //home: MyApp(),
    theme: theme,
  ));
}

class signin extends StatelessWidget {
  const signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close_outlined),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
                return MyAppSub();
            },)
            );
            }

    ),
        centerTitle: true,
        title: Text('로그인',
        style: TextStyle(
            color: Color(0xff000000),
            fontStyle: FontStyle.normal,
            fontSize: 20,
            fontWeight: FontWeight.w900)

        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
            child : Column(
                children: [
                  Container(//맨위 첫번쨰 박스,로고
                    child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Center(child: Image.asset('assets/images/logo.png', fit: BoxFit.contain, height:50)),
                          ),
                          signinbody(),
                        ],

                    ),
                  ),
                ]

            )
        ),
      ),




    );
  }
}





class signinbody extends StatefulWidget {
  const signinbody({Key? key}) : super(key: key);

  @override
  State<signinbody> createState() => _signinbodyState();
}


class _signinbodyState extends State<signinbody> {


  CurrentUser? currentUser;
  String usersigninEmail = '';
  String usersigninPassword = '';
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text('이메일 주소',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),

                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      key: ValueKey(1),
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
                          return '이메일형식에 맞춰주세요';
                        }
                        return null;
                      },
                      onSaved: (value){
                        usersigninEmail = value!;
                      },
                      onChanged: (value){
                        usersigninEmail = value;
                      },
                      keyboardType: TextInputType.name,
                      decoration:
                      InputDecoration(
                        hintText:'ex : example@lookup.com',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(width: 1, color: Colors.redAccent)
                        ),
                      ),

                    ),
                  ),
                             Container(
                                   child: Column(
                                         children: [
                                                      Container(
                                                        alignment: Alignment.topLeft,
                                                        margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                                                        child: Text('비밀번호',
                                                        style: TextStyle(
                                                         fontSize: 15,
                                                        fontWeight: FontWeight.w300),
                                                          textAlign: TextAlign.left,
                                               ),

                                                 ),
                                           Container(
                                                width: 350,
                                                    height: 50,
                                                 child: TextFormField(
                                                   obscureText: true,
                                                     key: ValueKey(1),
                                                validator: (value){
                                               if(value!.isEmpty || value.length < 6){
                                                   return '6자리이상 입력하세요';
                                        }
                                                   return null;
                                                 },
                                                   onSaved: (value){
                                                   usersigninPassword = value!;
                                         },
                                                   onChanged: (value){
                                                  usersigninPassword = value;
                                       },
                                 keyboardType: TextInputType.name,
                                  decoration:
                                           InputDecoration(
                                                   hintText:'6자리이상, 대소문자 구분',
                                                   focusedBorder: OutlineInputBorder(
                                                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                   borderSide: BorderSide(width: 1, color: Colors.redAccent)
                  ),
                ),

              ),
            ),


                ],
              ),
            ),







                    GestureDetector(
                      child: Container (
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff5C6EDA),

                        ),
                        child : TextButton(onPressed: ()async{
                          try {
                            final EmailUser = await _authentication
                                .signInWithEmailAndPassword(
                              email: usersigninEmail,
                              password: usersigninPassword,);
                            if(EmailUser.user != null){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return MyApp();
                              }
                              ),
                              );
                            }

                          }catch(e){
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('이메일과 패스워드를 확인해주세요.'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }


                        },
                          child: Text('이메일로 로그인',
                            style: TextStyle(
                              fontSize: 20,
                              backgroundColor: Color(0xff5C6EDA),
                              color: Color(0xffffffff),
                            ),

                          ),

                        ),
                      ),
                    ),




                    GestureDetector(
                      child: Container (
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xfffffb00),
                        ),
                        child :
                        TextButton(onPressed: ()async{


                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return KakaoLogin();
                          }
                          )
                          );


                        },
                          child: Text('카카오톡으로 로그인',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff000000),
                            ),

                          ),

                        ),
                      ),
                    ),



                    GestureDetector(
                      child: Container (
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF1F8BFF),
                        ),
                        child : TextButton(onPressed: (){

                        },
                          child: Text('페이스북으로 로그인',
                            style: TextStyle(
                              fontSize: 20,

                              color: Color(0xff000000),
                            ),

                          ),

                        ),
                      ),
                    ),


          ],
        )
    ),
    ]
        ),
    );

  }
}
