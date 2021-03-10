/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_multicaixa/src/controllers/login_controller/login_controller.dart';
import 'package:ui_multicaixa/src/models/login_model.dart';
import 'package:ui_multicaixa/src/pages/home-page.dart';
import 'package:ui_multicaixa/src/pages/validation_code_view/validation_code_view.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/navigator_util.dart';
//import 'package:ui_multicaixa/src/utils/navigator_util.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';
import 'package:ui_multicaixa/src/pages/components/custom_btn_component.dart';
import 'package:ui_multicaixa/src/pages/components/custom_text_field_component.dart';
import 'package:ui_multicaixa/src/utils/snack_bar_component.dart';
//import 'package:prest_servico/src/views/home_view/home_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool obscureText = true;

  final _loginController = locator.get<LoginController>();

  final txtPhone = TextEditingController();
  FocusNode focusPhone;

  final txtPassword = TextEditingController();
  FocusNode focusPassword;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() { 
    focusPhone = FocusNode();
    focusPassword = FocusNode();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
       return SingleChildScrollView(
        child: IgnorePointer(
          ignoring: _loginController.isLoading,
          child: Container(
            height: context.sizedDevice.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    IMG_LOGO,
                    height: context.sizedDevice.height / 5,
                    width: context.sizedDevice.width / 1.2,
                    //fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 50,),

                Divider(),
                SizedBox(height: 10,),
                CustomTextFieldComponent(
                  focusNode: focusPhone,
                  controller: txtPhone,
                  hintText: "Telefone",
                  icon: Icon(
                    Icons.phone_android,
                    color: COLOR_BFA,
                  ),
                  textInputType: TextInputType.number,
                ),

                SizedBox(height: 20,),

                CustomTextFieldComponent(
                  focusNode: focusPassword,
                  controller: txtPassword,               
                  hintText: "Palavra-Passe",
                  icon: Icon(
                    Icons.lock,
                    color: COLOR_BFA,
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 40,),

                _loginController.isLoading
                ? Center(child:  CircularProgressIndicator(),)
                : CustomBtnComponent(
                  text: "Entrar",
                  onPressed: login,
                ),
                SizedBox(height: 10,),

                Divider(),

               

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
          ),
        ),
      );
      }
     )
    );
  }


  login() async {

    if(txtPhone.text.trim().isEmpty || txtPassword.text.trim().isEmpty) {
      showSnackBarCustomized(key: scaffoldKey, msg: "Preencha todos campos");
    } else {

     focusPassword.unfocus();
     focusPhone.unfocus();

    _loginController.login(model: LoginModel(
        phone: txtPhone.text.trim(),
        password: txtPassword.text.trim()
      )
    ).then((res) {
        if (res.objetoUser != null) {
            if (!res.objetoUser.isComplete) {
              print(res.objetoUser.toJson());
              GoTo.page(context, page: ValidationCodeView(phone: res.objetoUser.phone,));

            } else if (!res.objetoUser.status) {
              showSnackBarCustomized(key: scaffoldKey, msg: "Conta desativa, consulta o admin"); 

            } else {
              //nameUser = res.objetoUser.firstName + " " + res.objetoUser.secondName;
              //emailUser = res.objetoUser.email;
              
              GoTo.pageWithoutReturn(context, page: HomePage());

              print("AQUIIII");
            }

       } else {
        showSnackBarCustomized(key: scaffoldKey, msg: res.message ?? "");
       }
     });
    }
  }
}