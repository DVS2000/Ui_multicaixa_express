import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_multicaixa/src/controllers/user_controller/user_controller.dart';
import 'package:ui_multicaixa/src/interfaces/loca_storage_interface.dart';
import 'package:ui_multicaixa/src/pages/intro_view/intro_view.dart';
import 'package:ui_multicaixa/src/services/local_storage_service.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/navigator_util.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final userController = locator.get<UserController>();
  @override
  void initState() {
    userController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      Container(
        height: size.height / 1.8,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height / 3.3,
                width: size.width,
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: colorMain,
                    gradient: StringGlobal.currentIndex == 0
                        ? gradientStandard
                        : null,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(15))),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Perfil",
                        style: TextStyle(
                            fontFamily: FONT_NORMAL,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Observer(
              builder: (_) {
              return Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 100),
                  height: size.height / 2.9,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        blurRadius: 14,
                        offset: Offset(0.0, 5.0)
                      )
                    ]
                  ),
                  child: userController.isLoading
                  ? Center(child: CircularProgressIndicator(),)
                  : userController.user.objetoUser == null
                  ? Center(
                  child: Text(
                    userController.users.message.toUpperCase(),
                    style: TextStyle(
                      fontFamily: FONT_NORMAL,
                      color: COLOR_STANDARD,
                      fontSize: 22
                    ),
                   )
                  ) 
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: colorMain.withOpacity(.2),
                          border: Border.all(color: colorMain, width: 2),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${userController.user.objetoUser.firstName.substring(0, 1) ?? ""}${userController.user.objetoUser.secondName.substring(0,1) ?? ""}",
                          style: TextStyle(
                            fontFamily: FONT_NORMAL, 
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: COLOR_STANDARD
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${userController.user.objetoUser.firstName ?? ""} ${userController.user.objetoUser.secondName ?? ""}",
                        style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        userController.user.objetoUser.email ?? "",
                        style: TextStyle(
                          fontFamily: FONT_NORMAL,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        userController.user.objetoUser.phone ?? "",
                        style: TextStyle(
                          fontFamily: FONT_NORMAL,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Text(
            "GERAL",
            style: TextStyle(fontFamily: FONT_BOLD, color: colorMain),
          ),
          SizedBox(
            height: 10,
          ), 
          SharedWidget.itemProfile(
              size: size,
              title: "Definições do Perfil",
              description: "Atualiza o seu perfil.",
              icon: Icons.settings),
          SharedWidget.itemProfile(
              size: size,
              title: "Privacidade",
              description: "Mudar Palavra-passe.",
              icon: Icons.lock),
          SharedWidget.itemProfile(
              size: size,
              title: "Notificações",
              description: "Mudar suas definições de notifacação.",
              icon: Icons.notifications),
          SharedWidget.itemProfile(
              onTap: () async {
                ILocalStorage storage = LocalStorageService();
                await storage.remove(key: null).then((_) => GoTo.pageWithoutReturn(context, page: IntroView()));
              },
              size: size,
              title: "Terminar",
              description: "Terminar sessão na aplicação.",
              icon: Icons.power_settings_new)
        ],
      )
    ]);
  }
}
