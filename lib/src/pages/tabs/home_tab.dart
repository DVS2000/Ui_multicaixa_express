import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_multicaixa/src/controllers/saldo_controller/saldo_controller.dart';
import 'package:ui_multicaixa/src/controllers/transferencia_controller/transferencia_controller.dart';
import 'package:ui_multicaixa/src/controllers/user_controller/user_controller.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';
import 'package:ui_multicaixa/src/utils/chart_percentagem.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';
import 'package:ui_multicaixa/src/utils/status_bar_color_util.dart';
import '../../utils/consts.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final saldoController = locator.get<SaldoController>();
  final userController = locator.get<UserController>();
  final transferenciaController = locator.get<TransferenciaController>();

  int index = 0;
  void onChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  void initState() {
    setStatusBarLight();
    saldoController.get();
    userController.getData();
    userController.getAllUsers();
    transferenciaController.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: size.height / 1.8,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.height / 2.4,
                  width: size.width,
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: colorMain,
                    gradient: StringGlobal.currentIndex == 0
                        ? gradientStandard
                        : null,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Observer(builder: (_) {
                          return userController.isLoading
                              ? SizedBox()
                              : Text(
                                  "${userController.user.objetoUser.firstName ?? ""} ${userController.user.objetoUser.secondName ?? ""}",
                                  style: TextStyle(
                                      fontFamily: FONT_NORMAL,
                                      color: Colors.white,
                                      fontSize: 18),
                                );
                        }),
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: size.height / 2.3,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.3),
                            blurRadius: 14,
                            offset: Offset(0.0, 5.0))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Observer(builder: (_) {
                        return Expanded(
                            child: saldoController.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          colorMain),
                                    ),
                                  )
                                : ChartPercetagem(
                                    color: colorMain,
                                    value: 60,
                                    money: saldoController?.model?.data?.valor
                                        .toString()
                                        .replaceAll('.', ','),
                                  ));
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: <Widget>[
            Text(
              "Transferências",
              style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 18),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Observer(
              builder: (_) {
                return transferenciaController.isLoading
                ? CircularProgressIndicator()
                : ListView(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: transferenciaController.model.data.reversed.map((model) => SharedWidget.itemTransaction(
                      size: size, 
                      model: model
                    )
                  ).toList(),
                );
              }),
            )
          ],
        )
      ],
    );
  }
}
