import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lookup/core/controller/closet_ctrl.dart';
import 'package:lookup/core/service/closet_api.dart';
import 'package:lookup/core/service/storage_api.dart';


import 'firebase_options.dart';
import 'ui/shared/style.dart';
import 'ui/shared/type.dart';
import 'ui/view/closet.dart';
import 'ui/view/home.dart';
import 'ui/view/styling.dart';
import 'ui/view/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _apiInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      theme: theme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyAppSub()),
        GetPage(name: '/styling', page: () => Styling()),
      ],
    );
  }

  _apiInit() {
    Get.lazyPut<ClosetApi>(() => ClosetApi());
    Get.lazyPut<ClosetCtrl>(() => ClosetCtrl());
    Get.lazyPut<StorageApi>(() => StorageApi());
  }
}

class MyAppSub extends StatefulWidget {
  const MyAppSub({Key? key}) : super(key: key);

  @override
  State<MyAppSub> createState() => _MyAppSubState();
}

class _MyAppSubState extends State<MyAppSub> {
  late HomeTyp typ;

  @override
  void initState() {
    typ = HomeTyp.home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(), bottomNavigationBar: _buildBotNav());
  }

  _buildBody() {
    switch (typ) {
      case HomeTyp.home:
        return const Home();
      case HomeTyp.dibs:
        return const Center(child: Text('찜목록'));
      case HomeTyp.chat:
        return const Center(child: Text('채팅'));
      case HomeTyp.closet:
        return const Closet();
      case HomeTyp.myPage:
        return const signin();
    }
  }

  _buildBotNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜 목록'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
        BottomNavigationBarItem(
            icon: Icon(Icons.door_sliding_outlined), label: '옷장'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
      ],
      currentIndex: typ.index,
      showUnselectedLabels: true,
      elevation: 1,
      onTap: (index) => setState(() => typ = HomeTyp.values[index]),
    );
  }
}
