import 'package:flutter/material.dart';

class SocialNetworkBtnComponent extends StatelessWidget {

  final String text;
  final Function onPressed;
  final IconData icon;
  final Color color;

  SocialNetworkBtnComponent({@required this.text, this.onPressed, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: this.color,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                this.icon,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text ?? "",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
