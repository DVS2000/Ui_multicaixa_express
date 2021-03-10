import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';

class SharedWidget {
  SharedWidget(_);

  static Widget cardMulticaixa({Size size}) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width,
          height: size.height / 3,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 14.0),
          decoration: BoxDecoration(
              color: COLOR_CARD, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Saldo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: FONT_NORMAL),
                      ),
                      Text(
                        "10.000,00 Kz",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: FONT_NORMAL),
                      )
                    ],
                  ),
                  Image.asset(
                    LOGO,
                    height: 50,
                  )
                ],
              ),
              Image.asset(
                CHIP,
                fit: BoxFit.cover,
                height: 40,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      "****",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontFamily: FONT_MULTI),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "****",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontFamily: FONT_MULTI),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "****",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontFamily: FONT_MULTI),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "1234",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: FONT_MULTI),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Proprietário",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0,
                            fontFamily: FONT_NORMAL),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dorivaldo dos Santos",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: FONT_NORMAL),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Validade:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0,
                            fontFamily: FONT_NORMAL),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "12/20",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: FONT_NORMAL),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );

  static Widget cardMulticaixaBai(
          {Size size,
          String logo,
          String saldo,
          String validade,
          String lastNumber,
          Color color,
          Color background = Colors.white,
          double heightLogo = 30,
          bool shadowImg = true}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width,
          height: size.height / 3,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 14.0),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 5,
                    offset: Offset(0.0, 3.0))
              ]),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Opacity(
                  opacity: shadowImg ? .3 : 0,
                  child: Image.asset(logo),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Saldo",
                            style: TextStyle(
                                color: color,
                                fontSize: 13.0,
                                fontFamily: FONT_MULTI),
                          ),
                          Text(
                            saldo + ",00 AOA",
                            style: TextStyle(
                                color: color,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_MULTI),
                          )
                        ],
                      ),
                      Image.asset(
                        logo,
                        height: heightLogo,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  Image.asset(
                    CHIP,
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          lastNumber,
                          style: TextStyle(
                              color: color,
                              fontSize: 20.0,
                              fontFamily: FONT_MULTI),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Proprietário",
                            style: TextStyle(
                                color: color,
                                fontSize: 11.0,
                                fontFamily: FONT_MULTI),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Dorivaldo dos Santos",
                            style: TextStyle(
                                color: color,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_MULTI),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Validade:",
                            style: TextStyle(
                                color: color,
                                fontSize: 11.0,
                                fontFamily: FONT_NORMAL),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            validade,
                            style: TextStyle(
                                color: color,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_NORMAL),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );

  static Widget cardMulticaixaBFA(
          {Size size,
          String logo,
          String saldo,
          String validade,
          String lastNumber,
          Color color,
          Color background = Colors.white,
          double heightLogo = 30}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width,
          height: size.height / 3,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 14.0),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 5,
                    offset: Offset(0.0, 3.0))
              ]),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(BFA_FUNDO),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Saldo",
                            style: TextStyle(
                                color: color,
                                fontSize: 13.0,
                                fontFamily: FONT_MULTI),
                          ),
                          Text(
                            saldo + ",00 AOA",
                            style: TextStyle(
                                color: color,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_MULTI),
                          )
                        ],
                      ),
                      Image.asset(
                        logo,
                        height: heightLogo,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  Image.asset(
                    CHIP,
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          lastNumber,
                          style: TextStyle(
                              color: color,
                              fontSize: 20.0,
                              fontFamily: FONT_MULTI),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Proprietário",
                            style: TextStyle(
                                color: color,
                                fontSize: 11.0,
                                fontFamily: FONT_MULTI),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Dorivaldo dos Santos",
                            style: TextStyle(
                                color: color,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_MULTI),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Validade:",
                            style: TextStyle(
                                color: color,
                                fontSize: 11.0,
                                fontFamily: FONT_NORMAL),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            validade,
                            style: TextStyle(
                                color: color,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_NORMAL),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );

  static Widget cardMulticaixaStandard(
          {Size size,
          String logo,
          String saldo,
          String validade,
          String lastNumber,
          Color color,
          Color background = Colors.white,
          double heightLogo = 30}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width,
          height: size.height / 3,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 14.0),
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 5,
                    offset: Offset(0.0, 3.0))
              ]),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Opacity(
                  opacity: .1,
                  child: Image.asset(
                    STANDARD,
                    height: size.height / 6,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Saldo",
                            style: TextStyle(
                                color: color,
                                fontSize: 13.0,
                                fontFamily: FONT_MULTI),
                          ),
                          Text(
                            saldo + ",00",
                            style: TextStyle(
                                color: color,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_MULTI),
                          )
                        ],
                      ),
                      Image.asset(
                        logo,
                        height: heightLogo,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  Image.asset(
                    CHIP,
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "****",
                          style: TextStyle(
                              color: color,
                              fontSize: 25.0,
                              fontFamily: FONT_MULTI),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          lastNumber,
                          style: TextStyle(
                              color: color,
                              fontSize: 20.0,
                              fontFamily: FONT_MULTI),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Proprietário",
                            style: TextStyle(
                                color: color,
                                fontSize: 11.0,
                                fontFamily: FONT_MULTI),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Dorivaldo dos Santos",
                            style: TextStyle(
                                color: color,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_MULTI),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Validade:" + validade,
                            style: TextStyle(
                                color: color,
                                fontSize: 11.0,
                                fontFamily: FONT_NORMAL),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            VISA,
                            height: 15,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );

  static Widget itemTransacao(
          {Size size, Transacoes transacao, bool status = false}) =>
      Container(
        height: 70,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey.withOpacity(.5),
                  style: BorderStyle.solid,
                  width: .25)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: status
                      ? COLOR_BAI.withOpacity(.2)
                      : COLOR_CARD.withOpacity(.1),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundImage: AssetImage(transacao.img ?? KUBINGA),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  transacao.entidade ?? "",
                  style: TextStyle(
                      fontFamily: FONT_NORMAL, fontWeight: FontWeight.bold),
                ),
                Text(
                  transacao.data ?? "",
                  style: TextStyle(fontFamily: FONT_NORMAL),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                transacao.valor ?? "",
                style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 10.0),
              ),
            )
          ],
        ),
      );

  static Widget cardCredDeb({Size size}) => Container(
        height: size.height / 5,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 5,
                  offset: Offset(0.0, 3.0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Débito",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: FONT_NORMAL,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Crédito",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: FONT_NORMAL,
                    //fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_downward,
                  color: Colors.green,
                  size: 20,
                ),
                Text(
                  "50.00, 00 Kz",
                  style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 13),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_upward,
                  color: Colors.red,
                  size: 20,
                ),
                Text(
                  "75.00, 00 Kz",
                  style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 13),
                )
              ],
            )
          ],
        ),
      );

  static Widget linePercentagem(Percentagem day) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: day.size,
            width: 10,
            decoration: BoxDecoration(
                color: day.color, borderRadius: BorderRadius.circular(30)),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            day.dayOfWeek ?? "",
            style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 12),
          )
        ],
      );

  static Widget itemMenu(
          {@required String text,
          double sizeIcon = 30,
          @required IconData icon,
          @required Color color,
          Function onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: sizeIcon,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: FONT_LIGHT, color: color, fontSize: 10.0),
            )
          ],
        ),
      );

  static Widget indicators({@required bool status, Color color}) =>
      AnimatedContainer(
        duration: Duration(milliseconds: 250),
        margin: EdgeInsets.only(left: 5),
        width: status ? 30 : 10,
        height: 8,
        decoration: BoxDecoration(
            color: status ? Colors.white : color,
            borderRadius:
                status ? BorderRadius.circular(30) : BorderRadius.circular(100),
            border: status ? Border.all(color: color, width: .5) : null),
      );

  static Widget btnHome(
          {@required Color color,
          @required String text,
          @required IconData icon,
          Function onTap}) =>
      Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: color.withOpacity(.1),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                ),
                Text(
                  text,
                  style: TextStyle(fontFamily: FONT_NORMAL, color: color),
                )
              ],
            ),
          ),
        ),
      );

  static Widget itemTransaction(
          {@required Size size, @required Transacoes transacao}) =>
      Container(
        height: 50,
        width: size.width,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 14,
                  offset: Offset(0.0, 5.0))
            ]),
        child: Row(
          children: <Widget>[
            Container(
              width: 40,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: COLOR_STANDARD,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                transacao.entidade.substring(0,1),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transacao.entidade,
                  style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 18),
                ),
                Text(
                  transacao.data,
                  style: TextStyle(
                      fontFamily: FONT_NORMAL,
                      fontSize: 12,
                      color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Text(
              transacao.valor,
              style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 10),
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      );

  static Widget itemProfile(
          {@required Size size,
          IconData icon,
          String title,
          String description}) =>
      Container(
        height: 55,
        width: size.width,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 14,
                  offset: Offset(0.0, 5.0))
            ]),
        child: Row(
          children: <Widget>[
            Container(
              width: 45,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: colorMain.withOpacity(.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: colorMain,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontFamily: FONT_NORMAL, fontSize: 18),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontFamily: FONT_NORMAL,
                      fontSize: 12,
                      color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      );

  static Widget addContact() => AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 80,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: colorMain, style: BorderStyle.solid, width: .5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 14,
                  offset: Offset(0.0, 5.0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_circle_outline,
              color: colorMain,
              size: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Add novo \ncontacto",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: FONT_NORMAL, color: Colors.grey),
            )
          ],
        ),
      );

  static Widget contactItem({String nome, String img}) => Container(
        width: 80,
        height: 120,
        margin: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 10,
                  offset: Offset(0.0, 5.0))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: colorMain.withOpacity(.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorMain, 
                    style: BorderStyle.solid, 
                    width: .5
                  ),
              ),
              alignment: Alignment.center,
              child: Text(
                nome.split(' ').first.substring(0,1) + nome.split(' ').last.substring(0,1), 
                style: TextStyle(
                  fontFamily: FONT_NORMAL,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colorMain
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                nome,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: FONT_NORMAL, color: Colors.grey),
              ),
            )
          ],
        ),
      );

  static Widget itemPagamento({String text, String img}) => Container(
        height: 65,
        width: 65,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Opacity(
                      opacity: .1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorMain,
                            shape: BoxShape.circle,
                            gradient: StringGlobal.currentIndex == 0
                                ? gradientStandard
                                : null),
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      img,
                      height: 45,
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
            Text(
              text,
              style: TextStyle(fontFamily: FONT_NORMAL),
            )
          ],
        ),
      );
  
  static Widget cardPagaemtno(Pagamento pagamento) => Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(.5),
                    width: .3
                  )
                )
              ),
              child: Row(
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: colorMain.withOpacity(.1),
                      shape: BoxShape.circle
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, 
                        image: DecorationImage(
                          image: AssetImage(pagamento.img),
                          fit: BoxFit.cover

                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        pagamento.nome,
                        style: TextStyle(
                          fontFamily: FONT_BOLD,
                          
                        ),
                      ),
                      SizedBox(height: 1,),
                      Text(
                        pagamento.produtos,
                        style: TextStyle(
                          fontFamily: FONT_NORMAL,
                          color: Colors.grey,
                          fontSize: 12.0
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
}
