import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ui_multicaixa/src/controllers/transferencia_controller/transferencia_controller.dart';
import 'package:ui_multicaixa/src/controllers/user_controller/user_controller.dart';
import 'package:ui_multicaixa/src/models/transferencia_model.dart';
import 'package:ui_multicaixa/src/services/locator_service.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';

int _index = 0;

class CarteiraTab extends StatefulWidget {
  @override
  _CarteiraTabState createState() => _CarteiraTabState();
}

class _CarteiraTabState extends State<CarteiraTab> {
  // PageController _pageController;

  final usersController = locator.get<UserController>();
  final transferenciaController = locator.get<TransferenciaController>();

  String idUserTO;
  String valor;

  @override
  void initState() {
    //_pageController = PageController(viewportFraction: 0.92, initialPage: StringGlobal.initPage);
    super.initState();
  }

  int index = -1;
  int indexUsers = -1;

  List<Valores> valores = [
    Valores(descricao: "2.000 kzs", valor: "2000"),
    Valores(descricao: "4.000 kzs", valor: "4000"),
    Valores(descricao: "10.000 kzs", valor: "10000"),
    Valores(descricao: "15.000 kzs", valor: "15000"),
    Valores(descricao: "25.000 kzs", valor: "25000"),
    Valores(descricao: "30.000 kzs", valor: "30000"),
  ];

  String getBank() {
    if (_index == 0 || StringGlobal.initPage == 0) {
      return "Standard Bank";
    } else if (_index == 1 || StringGlobal.initPage == 1) {
      return "Banco BFA";
    } else if (_index == 2 || StringGlobal.initPage == 2) {
      return "Banco Sol";
    } else if (_index == 3 || StringGlobal.initPage == 3) {
      return "Banco BAI";
    } else if (_index == 4 || StringGlobal.initPage == 4) {
      return "Banco Atlântico";
    } else if (_index == 5 || StringGlobal.initPage == 5) {
      return "Banco Keve";
    } else {
      return "xxxx";
    }
  }

  String getIban() {
    if (_index == 0 || StringGlobal.initPage == 0) {
      return "AO06.0006.0000.2312.9868.0122";
    } else if (_index == 1 || StringGlobal.initPage == 1) {
      return "AO06.0006.0000.9906.1223.0142";
    } else if (_index == 2 || StringGlobal.initPage == 2) {
      return "AO06.0006.0000.2345.1234.1122";
    } else if (_index == 3 || StringGlobal.initPage == 3) {
      return "AO06.0006.0000.0989.1267.4323";
    } else if (_index == 4 || StringGlobal.initPage == 4) {
      return "AO06.0006.0000.9124.5468.8989";
    } else if (_index == 5 || StringGlobal.initPage == 5) {
      return "AO06.0006.0000.4455.3322.5431";
    } else {
      return "xxxx";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 35,
        ),
        /*Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Carteira",
                style: TextStyle(
                    fontFamily: FONT_BOLD, color: Colors.black, fontSize: 18),
              ),
              Icon(
                FontAwesomeIcons.solidCreditCard,
                color: colorMain,
              )
            ],
          ),
        ),*/
        /* Container(
          height: size.height / 3,
          width: size.width,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                StringGlobal.functionTab(index);
                _index = index;
                StringGlobal.initPage = index;
              });
            },
            children: <Widget>[
              SharedWidget.cardMulticaixaStandard(
                size: size,
                logo: STANDARD,
                saldo: "\$1000.000",
                validade: "02/22",
                lastNumber: "5390",
                color: COLOR_STANDARD,
              ),
              SharedWidget.cardMulticaixaBFA(
                size: size,
                logo: BFA,
                saldo: "900.000",
                validade: "03/25",
                lastNumber: "2678",
                color: COLOR_BFA,
              ),
              SharedWidget.cardMulticaixaBai(
                size: size,
                logo: SOL,
                saldo: "750.000",
                validade: "12/21",
                lastNumber: "1219",
                color: COLOR_SOL,
              ),
              SharedWidget.cardMulticaixaBai(
                  size: size,
                  logo: BAI,
                  saldo: "300.000",
                  validade: "07/20",
                  lastNumber: "1212",
                  color: COLOR_BAI,
                  shadowImg: false),
              SharedWidget.cardMulticaixaBai(
                  size: size,
                  logo: ATLANTICO,
                  saldo: "600.000",
                  validade: "01/21",
                  lastNumber: "5721",
                  color: Colors.white,
                  background: COLOR_ATLANTICO),
              SharedWidget.cardMulticaixaBai(
                size: size,
                logo: KEVE,
                saldo: "150.000",
                validade: "05/23",
                lastNumber: "9874",
                color: Color(0xff033968),
                heightLogo: 20,
              ),
            ],
          ),
        ),*/
        /*SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 20),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    AnimatedContainer(
                      width: 50,
                      duration: Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                          color: colorMain.withOpacity(.15),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_upward,
                          color: colorMain,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Crédito",
                            style: TextStyle(
                                fontFamily: FONT_BOLD,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "150.000,00 AOA",
                            style:
                                TextStyle(fontFamily: FONT_MULTI, fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: .4,
                height: 65,
                color: Colors.grey.withOpacity(.3),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    AnimatedContainer(
                      width: 50,
                      duration: Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                          color: colorMain.withOpacity(.15),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Icon(
                          Icons.arrow_downward,
                          color: colorMain,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Débito",
                            style: TextStyle(
                                fontFamily: FONT_BOLD,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "50.000,00 AOA",
                            style:
                                TextStyle(fontFamily: FONT_MULTI, fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),*/
        /* Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "IBAN: ",
              style: TextStyle(fontFamily: FONT_BOLD, color: Colors.grey),
            ),
            SelectableText(
              getIban(),
              style: TextStyle(
                fontFamily: FONT_MULTI,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        ),
        SizedBox(
          height: 10,
        ),*/
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
          child: Text(
            "Enviar dinheiro para:",
            style: TextStyle(fontFamily: FONT_BOLD, fontSize: 18),
          ),
        ),
        Container(
          height: 130,
          width: size.width,
          child: Observer(builder: (_) {
            return usersController.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : usersController.users.data == null
                ? Center(
                  child: Text(
                    usersController.users.message.toUpperCase(),
                    style: TextStyle(
                      fontFamily: FONT_NORMAL,
                      color: COLOR_STANDARD,
                      fontSize: 22
                    ),
                   )
                  ) 
                  : ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                        left: 5, bottom: 15.0, top: 5, right: 10),
                    children: usersController.users.data.map((user) {
                      return SharedWidget.contactItem(
                          onTap: () {
                            idUserTO = user.id.toString();
                            setState(() {
                              this.indexUsers =
                                  usersController.users.data.indexOf(user);
                            });
                          },
                          enable: this.indexUsers ==
                              usersController.users.data.indexOf(user),
                          nome: "${user.firstName} ${user.secondName}" ?? "");
                    }).toList(),
                  );
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 10,
                    offset: Offset(0.0, 5.0))
              ]),
          child: TextField(
            style: TextStyle(fontFamily: FONT_MULTI),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            onChanged: (value) => setState(() => valor = value),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "INSERIR O VALOR PRETENDIDO",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SelectableText(
              "Seleccione o valor que deseja ENVIAR".toUpperCase(),
              style: TextStyle(
                fontFamily: FONT_MULTI,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.count(
          padding: EdgeInsets.only(right: 15),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          children: valores
              .map((value) => GestureDetector(
                    onTap: () {
                      setState(() {
                        this.index = valores.indexOf(value);
                        valor = value.valor;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 150),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin: EdgeInsets.only(bottom: 15, left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: index == valores.indexOf(value)
                                    ? COLOR_STANDARD
                                    : Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  blurRadius: 10,
                                  offset: Offset(0.0, 5.0))
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          value.descricao,
                          style: TextStyle(
                              fontFamily: FONT_MULTI,
                              color: COLOR_STANDARD,
                              fontSize: 16),
                        )),
                  ))
              .toList(),
        ),
        Observer(
          builder: (_) {
          return transferenciaController.isLoading
          ? Center(
            child: CircularProgressIndicator(),
          ) : GestureDetector(
            onTap: () async {
              transferenciaController.store(model: ObjetoTransferencia(
                idUserFrom: int.parse(idUserFrom),
                idUserTo: int.parse(idUserTO),
                valor: valor
              )).then((res) {
                showDialog(context: context, builder: (context) {
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(res.message),
                    ),
                  );
                });
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 17),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 10,
                    offset: Offset(0.0, 5.0))
              ]),
              alignment: Alignment.center,
              child: Text(
                "Transferir".toUpperCase(),
                style: TextStyle(
                    color: COLOR_STANDARD,
                    fontFamily: FONT_NORMAL,
                    fontSize: 16),
              ),
            ),
          );
        })
      ],
    );
  }
}

class Valores {
  String descricao;
  String valor;

  Valores({this.descricao, this.valor});
}
