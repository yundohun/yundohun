import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/styling');
                      },
                      iconSize: 150,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: IconButton(
                      icon:
                          Image.asset('assets/images/btn-personalbranding.png'),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (c, i) {
                    return Container(
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
                                    'assets/images/goods_main_img1.png',
                                    width: 150,
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                                width: 400,
                                height: 120,
                                margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
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
                                        height: 20,
                                        alignment: Alignment.bottomLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Color(0xff5C6EDA),
                                            ),
                                            Text('  4.9  ',
                                                style: TextStyle(
                                                    fontSize: 10, height: 1.5)),
                                            Text(
                                              '5개의 평가',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xff909090)),
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
                      ),
                    );
                  }),
            ),
            Container(
                height: 30,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text('사업자정보확인 |'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            primary: Color(0xff909090),
                            textStyle: TextStyle(fontSize: 12))),
                    TextButton(
                        onPressed: () {},
                        child: Text('이용약관 |'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            primary: Color(0xff909090),
                            textStyle: TextStyle(fontSize: 12))),
                    TextButton(
                        onPressed: () {},
                        child: Text('전자금융거래이용약관 |'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            primary: Color(0xff909090),
                            textStyle: TextStyle(fontSize: 12))),
                    TextButton(
                        onPressed: () {},
                        child: Text(' 개인정보처리방침'),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            primary: Color(0xff191919),
                            textStyle: TextStyle(fontSize: 12))),
                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                alignment: Alignment.topLeft,
                height: 20,
                child: Row(
                  children: [
                    Text(
                      '(주)룩업',
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      height: 20,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '룩업은 통신판매중개자이며, 통신판매의 당사자가 아닙니다.',
                    style: TextStyle(color: Color(0xff909090)),
                  ),
                  Text('상품, 상품정보, 거래에 관한 의무와 책임은 판매자에게 있습니다.',
                      style: TextStyle(color: Color(0xff909090))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
