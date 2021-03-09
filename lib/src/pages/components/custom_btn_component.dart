import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';

class CustomBtnComponent extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color colorText;

  CustomBtnComponent({@required this.text, this.onPressed, this.color, this.colorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: context.sizedDevice.width / 1.2,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(.15),
            offset: Offset(0.0, 8.0),
            blurRadius: 14
          )
        ]
      ),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        child: FlatButton(
          onPressed: this.onPressed,
          child: Text(
            this.text ?? "Entrar",
            style: TextStyle(
              fontFamily: FONT_NORMAL, 
              fontWeight: FontWeight.bold,
              color: colorText ?? Colors.grey
            ),
          ),
        ),
      ),
    );
  }
}
