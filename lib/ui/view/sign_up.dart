import 'package:flutter/material.dart';
import 'package:lookup/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Center(
                    child: Image.asset('assets/images/logo.png',
                        fit: BoxFit.contain, height: 50)),
              ),
              Text('회 원 가 입',
                  style: TextStyle(
                      color: Color(0xff5C6EDA),
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.w900)),
              singupbody(),
            ],
          ),
        ),
      ),
    );
  }
}

class singupbody extends StatefulWidget {
  const singupbody({Key? key}) : super(key: key);

  @override
  State<singupbody> createState() => _singupbodyState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController usernameController = TextEditingController();

class _singupbodyState extends State<singupbody> {
  final _authentication = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';
  String userPasswordcheck = '';
  String userName = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(//1차 컬럼
          children: [
        //body제일큰박스
        Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                children: [
                  Container(
                    child: Text('정보입력',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      '사용자 이름',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      key: ValueKey(1),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return '4자리 이하로 적어주세요';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userName = value!;
                      },
                      onChanged: (value) {
                        userName = value;
                      },
                      keyboardType: TextInputType.name,
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: '이름을 입력해 주세요',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: Text(
                      '이메일주소',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      key: ValueKey(2),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return '이메일 형식에 맞추어 입력해주세요';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userEmail = value!;
                      },
                      onChanged: (value) {
                        userEmail = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: '이메일 주소를 입력하세요',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //비밀번호
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      '비밀번호',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      key: ValueKey(3),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return '6글자이상입력하세요';
                        }
                        return null;
                      },
                      onSaved: (Value) {
                        userPassword = Value!;
                      },
                      onChanged: (value) {
                        userPassword = value;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 입력해 주세요',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      key: ValueKey(4),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return '비밀번호가 일치하지 않습니다.';
                        }
                        return null;
                      },
                      onSaved: (Value) {
                        userPasswordcheck = Value!;
                      },
                      onChanged: (value) {
                        userPasswordcheck = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '비밀번호를 한번 더 입력해 주세요',
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //추천인
              child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Text(
                    '추천인!',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  width: 350,
                  height: 50,
                  child: TextFormField(
                    key: ValueKey(5),
                    decoration: InputDecoration(
                      hintText: '추천해주신분의 코드를 입력하면 쿠폰이 나옵니다!',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent)),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      '약관 동의',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_box),
                    ),
                    title: Text('만14세 이상입니다.'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_box),
                    ),
                    title: Text('개인정보 수집 및 이용 동의'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_box),
                    ),
                    title: Text('서비스 이용 약관 동의'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined),
                    ),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.check_box),
                    ),
                    title: Text('이벤트 알림 수신 동의'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_outlined),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
              width: 350,
              height: 70,
              color: Color(0xff5C6EDA),
              child: GestureDetector(
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      _tryValidation();
                      try {
                        final newUser = await _authentication
                            .createUserWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );
                        if (newUser.user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return MyAppSub();
                            }),
                          );
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('이메일과 패스워드를 확인해주세요.'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      }
                    },
                    child: Text(
                      '본인인증 하고 가입하기',
                      style: TextStyle(
                        fontSize: 20,
                        backgroundColor: Color(0xff5C6EDA),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
