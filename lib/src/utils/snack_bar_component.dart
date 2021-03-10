import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';

showSnackBarCustomized({@required String msg, @required GlobalKey<ScaffoldState> key, Color color}) {
    key.currentState.showSnackBar(
       SnackBar(
        backgroundColor: color ?? Colors.red,
        content: Text( msg ?? "",
          style: TextStyle(
          color: Colors.white,
          fontFamily: FONT_NORMAL
        ),
       ),
     )
   );
  }