import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';

// ignore: must_be_immutable
class ChartPercetagem extends StatefulWidget {
  double value;
  Color color;
  String money;
  ChartPercetagem({this.value, this.color, this.money});
  @override
  _ChartPercetagemState createState() => _ChartPercetagemState();
}

class _ChartPercetagemState extends State<ChartPercetagem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 10,
                color: COLOR_STANDARD
              )
            ),
          )
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                width: 10,
                color: COLOR_STANDARD.withOpacity(.2)
              )
            ),
          )
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                FontAwesomeIcons.creditCard,
                color: widget.color,
                size: 35,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "SALDO ATUAL".toUpperCase(),
                style: TextStyle(
                    fontFamily: FONT_MULTI, color: Colors.grey, fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.money + ",00 AOA",
                style: TextStyle(
                    fontFamily: FONT_MULTI,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            
          ],
        )
      ],
    );
  }
}
