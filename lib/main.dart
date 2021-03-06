import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_multicaixa/src/interfaces/loca_storage_interface.dart';
import 'package:ui_multicaixa/src/pages/home-page.dart';
import 'package:ui_multicaixa/src/pages/intro_view/intro_view.dart';
import 'package:ui_multicaixa/src/services/local_storage_service.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/status_bar_color_util.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  ILocalStorage storage = LocalStorageService();
  String token = await storage.get(key: "token");

  /* AQUI ESTOU A DEFINIR UMA ÚNICA 
  DIRECÇÃO QUE A APLICAÇÃO VAI RODAR 
  NESSE CASO NA VERTICAL NUNCA NA 
  HORIZONTAL 
  */

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  setStatusBarDark();
  setupLocator();
  
  runApp(MyApp(token: token,));
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String token;
  MyApp({this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Project Teste",
      theme: ThemeData.light().copyWith(
        primaryColor: PRIMARY_COLOR
      ),
      home: (token == "" || token == null) ? IntroView() : HomePage(),
    );
  }
}