import 'package:flutter/material.dart';

var theme = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            textStyle: TextStyle(fontSize: 13, color: Color(0xff909090)))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff191919),
      unselectedItemColor: Color(0xff191919),
    ),
    appBarTheme: AppBarTheme(
        elevation: 1,
        color: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff191919))),
    iconTheme: IconThemeData(color: Color(0xff191919)),
    textTheme: TextTheme(bodyText1: TextStyle()));
