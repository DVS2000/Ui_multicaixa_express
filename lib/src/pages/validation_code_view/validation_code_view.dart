/*
 * Name: Dorivaldo Vicente dos Santos
 * E-mail: dorivaldodossantos2000@gmail.com
 * Phone: 944557610 / 992228230(WhatsApp)
 * Github: https://github.com/DVS2000
 * Site: https://dorivaldodossantos.herokuapp.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_multicaixa/src/controllers/activate_account_controller/activate_account_controller.dart';
import 'package:ui_multicaixa/src/models/ative_account_model.dart';
import 'package:ui_multicaixa/src/pages/home-page.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';

import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/navigator_util.dart';
//import 'package:ui_multicaixa/src/utils/navigator_util.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';
import 'package:ui_multicaixa/src/utils/snack_bar_component.dart';
//import 'package:mbange_mobile/src/utils/snack_bar_component.dart';
import 'package:ui_multicaixa/src/utils/spaces_componet.dart';
//import 'package:ui_multicaixa/src/views/components/custom_circular_component.dart';
import 'package:ui_multicaixa/src/pages/components/custom_btn_component.dart';
//import 'package:mbange_mobile/src/views/home_view/home_view.dart';
import 'components/input_number_pin.dart';

// ignore: must_be_immutable
class ValidationCodeView extends StatefulWidget {
  String phone;

  ValidationCodeView({@required this.phone});
  @override
  _ValidationCodeViewState createState() => _ValidationCodeViewState();
}

class _ValidationCodeViewState extends State<ValidationCodeView> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final activateAccountControlller = locator.get<ActivateAccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Observer(
        builder: (BuildContext context) {
        return IgnorePointer(
          ignoring: activateAccountControlller.isLoading,
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [

              SpaceByHeigth(
                space: 10,
              ),
              Center(
                child: Text(
                  "Confirmar Conta",
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontFamily: FONT_NORMAL,
                      fontWeight: FontWeight.bold,
                      fontSize: context.sizedDevice.width / 15
                  )
                ),
              ),
              SpaceByHeigth(
                space: 10,
              ),
              CodeValidationComponent(),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text(
                "Caso não recebeu o seu código de validação dentro de 60 segundos carregue em \"Reenviar\" ou tente mais tarde.",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FONT_NORMAL,
                  height: 1,
                  fontSize: context.sizedDevice.width / 30
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () async {
                    print("AQUI");
                    await activateAccountControlller.forgotPassword(phone: widget.phone).then((res) {
                      print(res.statusCode);
                      showSnackBarCustomized(
                        key: scaffoldKey, 
                        msg: res.message, 
                        color: res.statusCode == 200 ? Colors.black : Colors.red
                      );
                    });
                  },
                  child: Text(
                    "*Reenviar",
                    style: TextStyle(
                      color: PRIMARY_COLOR, 
                      fontFamily: FONT_NORMAL
                    ),
                  ),
                ),
              ),
              SpaceByHeigth(
                space: 10,
              ),

              activateAccountControlller.isLoading
              ? Center(child: CircularProgressIndicator(),)
              : CustomBtnComponent(
                text: "Confirmar",
                onPressed: () {
                   if(code.length < 4) {
                    showSnackBarCustomized(key: scaffoldKey, msg: "Código imcompleto");
                  } else {
                    activateAccountControlller.activateAccount(
                      model: ActivateAccountModel(
                        phone: widget.phone,
                        code: code
                      )
                    ).then((res) {
                      if(res.objetoUser != null) {
                        //nameUser = res.objetoUser.firstName + " " + res.objetoUser.secondName;
                        //emailUser = res.objetoUser.email;
                        
                        GoTo.pageWithoutReturn(context, page: HomePage());
                      } else {
                        showSnackBarCustomized(key: scaffoldKey, msg: res?.message);
                      }
                    });
                  }
                },
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        );
      }
    )
  );
}
}
