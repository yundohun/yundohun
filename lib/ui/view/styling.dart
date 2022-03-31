import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Styling extends StatelessWidget {
  const Styling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Image.asset('assets/images/logo.png'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, iconSize: 30, icon: Icon(Icons.search)),
          ]),
      body: MainContents(),
    );
  }
}

class MainContents extends StatefulWidget {
  const MainContents({Key? key}) : super(key: key);

  @override
  State<MainContents> createState() => _MainContentsState();
}

class _MainContentsState extends State<MainContents> {
  var tab = 0;
  addZero() {
    setState(() {
      tab = 0;
    });
  }

  addOne() {
    setState(() {
      tab = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: [
        Tab0(addOne: addOne, addZero: addZero),
        Tab1(addOne: addOne, addZero: addZero)
      ][tab],
    );
  }
}

//스타일링
class Tab0 extends StatefulWidget {
  const Tab0({Key? key, this.addOne, this.addZero}) : super(key: key);
  final addOne;
  final addZero;

  @override
  State<Tab0> createState() => _Tab0State();
}

class _Tab0State extends State<Tab0> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('product/r1EZp6kezD5WJy74O1dj/service0')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          var f = NumberFormat('###,###,###');
          return Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(16, 4, 10, 0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 3, color: Color(0xff5C6EDA)))),
                          child: TextButton(
                              onPressed: () {
                                widget.addZero();
                              },
                              child: Text(
                                '퍼스널 스타일링',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff191919)),
                              ))),
                      Container(
                          child: TextButton(
                              onPressed: () {
                                widget.addOne();
                              },
                              child: Text('퍼스널 브랜딩',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffd4d4d4))))),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.fromLTRB(16, 14, 0, 0),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  child: Image.asset(
                                    docs[index]['images'].toString(),
                                    width: 100,
                                    height: 100,
                                  )),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 200,
                                        child: Text(docs[index]['title'])),
                                    Container(height: 20),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Color(0xff5C6EDA),
                                        ),
                                        Text(
                                          ' ' + docs[index]["like"].toString(),
                                          style: TextStyle(
                                              fontSize: 10, height: 1.5),
                                        ),
                                        Text(
                                          ' ' +
                                              docs[index]["reviewcount"]
                                                  .toString() +
                                              '개의 평가',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff909090)),
                                        )
                                      ],
                                    ),
                                    Container(height: 3),
                                    Text(f.format(docs[index]["price"]) + '원'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 16, 2),
                          height: 1,
                          color: Colors.black.withOpacity(0.3),
                        );
                      },
                      itemCount: docs.length),
                ),
              ],
            ),
          );
        });
  }
}

//퍼스널 브랜딩
class Tab1 extends StatefulWidget {
  const Tab1({Key? key, this.addOne, this.addZero}) : super(key: key);
  final addOne;
  final addZero;

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('product/r1EZp6kezD5WJy74O1dj/service1')
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final docs = snapshot.data!.docs;
        if (docs.isEmpty) {
          return Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 16),
                          child: TextButton(
                              onPressed: () {
                                widget.addZero();
                              },
                              child: Text(
                                '퍼스널 스타일링',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xffd4d4d4)),
                              ))),
                      Container(
                          margin: EdgeInsets.fromLTRB(16, 4, 10, 0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 3, color: Color(0xff5C6EDA)))),
                          child: TextButton(
                              onPressed: () {
                                widget.addOne();
                              },
                              child: Text('퍼스널 브랜딩',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff191919)))))
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Icon(
                      Icons.announcement_outlined,
                      size: 100,
                      color: Color(0xff999999),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "등록된 서비스가 없습니다.",
                      style: TextStyle(fontSize: 30, color: Color(0xff909099)),
                    )
                  ],
                )),
              ],
            ),
          );
        }
        var f = NumberFormat('###,###,###');
        return Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: TextButton(
                            onPressed: () {
                              widget.addZero();
                            },
                            child: Text(
                              '퍼스널 스타일링',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xffd4d4d4)),
                            ))),
                    Container(
                        margin: EdgeInsets.fromLTRB(16, 4, 10, 0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: Color(0xff5C6EDA)))),
                        child: TextButton(
                            onPressed: () {
                              widget.addOne();
                            },
                            child: Text('퍼스널 브랜딩',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff191919)))))
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.fromLTRB(16, 14, 0, 0),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                child: Image.asset(
                                  docs[index]['images'].toString(),
                                  width: 100,
                                  height: 100,
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 200,
                                      child: Text(docs[index]['title'])),
                                  Container(height: 20),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Color(0xff5C6EDA),
                                      ),
                                      Text(
                                        ' ' + docs[index]["like"].toString(),
                                        style: TextStyle(
                                            fontSize: 10, height: 1.5),
                                      ),
                                      Text(
                                        ' ' +
                                            docs[index]["reviewcount"]
                                                .toString() +
                                            '개의 평가',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff909090)),
                                      )
                                    ],
                                  ),
                                  Container(height: 3),
                                  Text(f.format(docs[index]["price"]) + '원'),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 16, 2),
                        height: 1,
                        color: Colors.black.withOpacity(0.3),
                      );
                    },
                    itemCount: docs.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
