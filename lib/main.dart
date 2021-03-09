import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_multicaixa/src/pages/intro_view/intro_view.dart';
import 'package:ui_multicaixa/src/pages/splash-page.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UI Muilticaixa-Express",
      theme: ThemeData.light().copyWith(
        primaryColor: PRIMARY_COLOR
      ),
      home: IntroView(),
    );
  }
}