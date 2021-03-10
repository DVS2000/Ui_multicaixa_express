import 'package:flutter/material.dart';
import 'package:ui_multicaixa/src/utils/size_utils.dart';

class SpaceByWidth extends StatelessWidget {

  final double space;

  SpaceByWidth({@required this.space});
   
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.sizedDevice.height / this.space);
  }
}

class SpaceByHeigth extends StatelessWidget {

  final double space;

  SpaceByHeigth({@required this.space});
   
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.sizedDevice.height / this.space);
  }
}