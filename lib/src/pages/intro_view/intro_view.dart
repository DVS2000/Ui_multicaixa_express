/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/navigator_util.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';
import 'package:ui_multicaixa/src/pages/components/custom_btn_component.dart';
import 'package:ui_multicaixa/src/pages/create_account_view/create_account_view.dart';
import 'package:ui_multicaixa/src/pages/login_view/login_view.dart';

class IntroView extends StatefulWidget {
  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Hero(
            tag: "logo",
            child: Image.asset(
              IMG_LOGO,
              height: context.sizedDevice.height / 3,
              width: context.sizedDevice.width / 1.2,
              //fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Bem-Vindo".toUpperCase(),
            style: TextStyle(
              fontFamily: FONT_NORMAL,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black
            ),
          ),

          SizedBox(height: 40,),
          CustomBtnComponent(
            text: "Entrar",
            onPressed: () => GoTo.page(context, page: LoginView()),
          ),
          SizedBox(height: 10,),

          Divider(),

          SizedBox(height: 10,),
          CustomBtnComponent(
            text: "Criar Conta",
            onPressed: () => GoTo.page(context, page: CreateAccountView()),
          ),
          SizedBox(height: 10,),
          
          
          Center(
            child: SizedBox(),
          ),

          Spacer(),
          Text(
            "WWW.LIGHTSYSTEMS.CO.AO\n${ DateTime.now().day }/0${ DateTime.now().month }/${ DateTime.now().year }",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontFamily: FONT_NORMAL,
              fontSize: 11
            ),
          ),

          SizedBox(height: 20,)
        ],
      ),
    );
  }
}