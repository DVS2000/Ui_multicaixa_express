/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone/WhatsApp: 944557610
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_multicaixa/src/controllers/create_account_controller/create_account_controller.dart';
import 'package:ui_multicaixa/src/models/create_account_model.dart';
import 'package:ui_multicaixa/src/pages/validation_code_view/validation_code_view.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/navigator_util.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';
import 'package:ui_multicaixa/src/pages/components/custom_btn_component.dart';
import 'package:ui_multicaixa/src/pages/components/custom_text_field_component.dart';
import 'package:ui_multicaixa/src/utils/snack_bar_component.dart';

class CreateAccountView extends StatefulWidget {
  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {

  bool obscureText = true;

  final createAccountController = locator.get<CreateAccountController>();

  // Controllers for textfields
  final txtFirstName = TextEditingController();
  final txtSecondName = TextEditingController();
  final txtPhone = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
        return IgnorePointer(
          ignoring: createAccountController.isLoading,
          child: SingleChildScrollView(
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

                CustomTextFieldComponent(
                  controller: txtFirstName,
                  hintText: "Primeiro nome",
                  icon: Icon(
                    Icons.person,
                    color: COLOR_BFA,
                  ),
                ),

                SizedBox(height: 20,),

                CustomTextFieldComponent(
                  controller: txtSecondName,
                  hintText: "Último nome",
                  icon: Icon(
                    Icons.person,
                    color: COLOR_BFA,
                  ),
                ),

                SizedBox(height: 20,),

                CustomTextFieldComponent(
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
                  controller: txtEmail,
                  hintText: "E-mail",
                  textInputType: TextInputType.emailAddress,
                  icon: Icon(
                    Icons.email,
                    color: COLOR_BFA,
                  ),
                ),

                SizedBox(height: 20,),

                CustomTextFieldComponent(
                  controller: txtPassword,
                  hintText: "Palavra-Passe",
                  icon: Icon(
                    Icons.lock,
                    color: COLOR_BFA,
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 40,),

                createAccountController.isLoading
                ? Center(child:  CircularProgressIndicator(),)
                : CustomBtnComponent(
                  text: "Criar Conta",
                  onPressed: createdAccount,
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
           )
          ),
        );
       }
      ),
    );
  }

  void createdAccount() async {
    if(txtFirstName.text.trim().isEmpty || txtSecondName.text.trim().isEmpty || txtEmail.text.trim().isEmpty || txtPhone.text.trim().isEmpty || txtPassword.text.trim().isEmpty) {
        showSnackBarCustomized(key: scaffoldKey, msg: "Preencha todos os campos");
      } else {

      await createAccountController.createAccount(
        model: DataUser(
          firstName: txtFirstName.text.trim(),
          secondName: txtSecondName.text.trim(),
          phone: txtPhone.text.trim(),
          email: txtEmail.text.trim(),
          password: txtPassword.text.trim(),
          tipoId: 1
        )
      ).then((res) {
        if(res.dataUser != null) {
          GoTo.page(context, page: ValidationCodeView(phone: res.dataUser.phone,));
        } else {
          showSnackBarCustomized(key: scaffoldKey, msg: res.message);
        }
      }
     );
    }
  }
}