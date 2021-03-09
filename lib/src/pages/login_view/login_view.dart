/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
//import 'package:ui_multicaixa/src/utils/navigator_util.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';
import 'package:ui_multicaixa/src/pages/components/custom_btn_component.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_multicaixa/src/pages/components/custom_text_field_component.dart';
//import 'package:prest_servico/src/views/home_view/home_view.dart';
import 'package:ui_multicaixa/src/pages/login_view/components/social_network_btn_component.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: context.sizedDevice.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              /*Hero(
                tag: "logo",
                child: Image.asset(
                  IMG_LOGO,
                  height: context.sizedDevice.height / 5,
                  width: context.sizedDevice.width / 1.2,
                  //fit: BoxFit.cover,
                ),
              ),*/
              SizedBox(height: 50,),

              CustomTextFieldComponent(
                hintText: "Telefone",
                icon: Icon(
                  Icons.phone_android,
                  color: COLOR_BFA,
                ),
                textInputType: TextInputType.number,
              ),

              SizedBox(height: 20,),

              CustomTextFieldComponent(
                hintText: "Palavra-Passe",
                icon: Icon(
                  Icons.lock,
                  color: COLOR_BFA,
                ),
                obscureText: true,
              ),

              SizedBox(height: 40,),
              CustomBtnComponent(
                text: "Entrar",
                //onPressed: () => GoTo.page(context, page: HomeView()),
              ),
              SizedBox(height: 10,),

              Divider(),

              SizedBox(height: 10,),
              Container(
                height: 40,
                width: context.sizedDevice.width / 1.2,
                child: Row(
                  children: [

                    SocialNetworkBtnComponent(
                      text: "Google",
                      icon: FontAwesomeIcons.google,
                      color: Colors.red
                    ),

                    SizedBox(width: 10,),

                    SocialNetworkBtnComponent(
                      text: "Facebook",
                      icon: FontAwesomeIcons.facebook,
                      color: Color(0xff028BFA)

                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              
              
              Center(
                child: SizedBox(),
              ),

              Spacer(),
              Text(
                "WWW.PRESTACAO.CO.AO",
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: FONT_NORMAL,
                  fontSize: 11
                ),
              ),

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}