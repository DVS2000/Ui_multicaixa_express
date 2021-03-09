import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomTextFieldComponent extends StatelessWidget {

  final Widget icon;
  final bool showIcon;
  final String hintText;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final bool isExpanded;

  CustomTextFieldComponent({
    this.icon, 
    this.showIcon = true,
    this.hintText = "",
    this.minLines,
    this.maxLines,
    this.controller,
    this.textInputType,
    this.obscureText = false,
    this.isExpanded = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      width: isExpanded ? context.sizedDevice.width : context.sizedDevice.width / 1.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              offset: Offset(0.0, 8.0),
              blurRadius: 14
            )
          ]
        ),
      child: Row(
        children: [
          !showIcon
          ? SizedBox()
          : Container(
            width: 40,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: Colors.black.withOpacity(.1), 
                        width: .5
                      )
                    )
                  ),
            child: icon ?? Icon(
              CupertinoIcons.search,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: !showIcon ? 8.0 : 0),
              child: TextField(
                controller: controller,
                keyboardType: textInputType,
                obscureText: obscureText,
                style: TextStyle(
                  fontFamily: FONT_NORMAL, 
                  color: Colors.black
                ),
                minLines: minLines?? 1,
                maxLines:  maxLines ?? 1,
                decoration: InputDecoration(
                  border: InputBorder.none, 
                  hintText: hintText
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
