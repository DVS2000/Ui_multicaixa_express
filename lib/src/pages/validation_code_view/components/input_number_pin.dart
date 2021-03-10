import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/consts.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';

class CodeValidationComponent extends StatefulWidget {
  @override
  _CodeValidationComponentState createState() => _CodeValidationComponentState();
}

class _CodeValidationComponentState extends State<CodeValidationComponent> {

  int countInputs = 4;

  List<FocusNode> focus = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];


  @override
  void initState() {
    focus[0].requestFocus();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(countInputs, (index) => Expanded(
          child: Container(
            child: TextField(
              controller: controllers[index],
              focusNode: focus[index],
              onChanged: (value) {
                setState(() {
                  if(value.isNotEmpty) {
                    if((index >= 0) && (index < 3) ) {
                      focus[index + 1].nextFocus();
                    } else if(index == 3) {
                      focus[index].unfocus();
                      code = "${controllers[0].text}${controllers[1].text}${controllers[2].text}${controllers[3].text}";
                    }
                  } else {
                    if(index <= 3) {
                      focus[index- 1].previousFocus();
                    }
                  }
                });
              },
              textAlign: TextAlign.center,
              maxLength: 1,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: FONT_NORMAL,
                  fontSize: context.sizedDevice.width / 10),
              decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Color(0xff707070)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    ),
                    borderSide: BorderSide(width: .2)
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  counter: SizedBox()),
            ),
            margin: EdgeInsets.only(right: 10,),
            
          ),
        )
      )
    );
  }
}
