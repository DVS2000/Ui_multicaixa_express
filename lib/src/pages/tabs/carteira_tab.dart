import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/shared_widgets.dart';

int _index = 0;

class CarteiraTab extends StatefulWidget {
  @override
  _CarteiraTabState createState() => _CarteiraTabState();
}

class _CarteiraTabState extends State<CarteiraTab> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        viewportFraction: 0.92, initialPage: StringGlobal.initPage);
    super.initState();
  }

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                getBank(),
                style: TextStyle(
                    fontFamily: FONT_BOLD, color: Colors.black, fontSize: 18),
              ),
              Icon(
                FontAwesomeIcons.solidCreditCard,
                color: colorMain,
              )
            ],
          ),
        ),
        Container(
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
        ),
        SizedBox(
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
        ),
        Padding(
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
          child: Text(
            "Enviar Dinheiro Para:",
            style: TextStyle(fontFamily: FONT_BOLD, fontSize: 18),
          ),
        ),
        Container(
          height: 130,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, bottom: 15.0, top: 5, right: 10),
            children: <Widget>[
              //SharedWidget.addContact(),
              SharedWidget.contactItem(nome: "Anísio Gomes", img: ANISIO),
              SharedWidget.contactItem(nome: "José Manuel", img: MOSTRINHO),
              SharedWidget.contactItem(nome: "Josefá Monteiro", img: JOSEFA),
              SharedWidget.contactItem(nome: "José Lukamba", img: LUKAMBA),
            ],
          ),
        ),
      ],
    );
  }
}
