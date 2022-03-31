import 'package:flutter/material.dart';
import 'ui/shared/style.dart' as style;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: style.theme,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.notifications),
              iconSize: 30,
              onPressed: () {},
            ),
            title: Image.asset('assets/images/logo.png'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {}, iconSize: 30, icon: Icon(Icons.search)),
            ]),
        body: MainContents(),
        bottomNavigationBar: BtmNavBar());
  }
}

class BtmNavBar extends StatefulWidget {
  const BtmNavBar({Key? key}) : super(key: key);

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        elevation: 1,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜 목록'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(
              icon: Icon(Icons.door_sliding_outlined), label: '옷장'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ]);
  }
}

class MainContents extends StatelessWidget {
  const MainContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: IconButton(
                    icon: Image.asset('assets/images/btn-styling.png'),
                    onPressed: () {},
                    iconSize: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: IconButton(
                    icon: Image.asset('assets/images/btn-personalbranding.png'),
                    onPressed: () {},
                    iconSize: 150,
                  ),
                ),
              ),
            ],
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
              child: Text(
                '룩업이 추천하는 서비스',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              )),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.fromLTRB(
                      20,
                      10,
                      0,
                      0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/images/goods_profile1.png',
                        width: 150,
                      ),
                    )),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    width: 400,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(16, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          child: Text(
                            '꼼꼼하고 트렌드에 맞는 스타일링 해드립니다.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                            height: 30,
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Color(0xff5C6EDA),
                                ),
                                Text('  4.9  ',
                                    style:
                                        TextStyle(fontSize: 10, height: 1.5)),
                                Text(
                                  '5개의 평가',
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xff909090)),
                                )
                              ],
                            )),
                        Container(
                          height: 30,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '100,000원 -',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class ListTitleTest extends StatelessWidget {
  const ListTitleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return Container(
              child: Image.asset('assets/images/logo.png'),
            );
          }),
    );
  }
}
