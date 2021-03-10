import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
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
  final GlobalKey<AnimatedCircularChartState> chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> chartKey2 =
      GlobalKey<AnimatedCircularChartState>();
  final charSize = const Size(300.0, 300.0);
  Color labelColor = Colors.blue[200];

  List<CircularStackEntry> generateChartData(double value, Color color) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(<CircularSegmentEntry>[
        new CircularSegmentEntry(value, color, rankKey: "percentage")
      ], rankKey: "percentage")
    ];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: AnimatedCircularChart(
            key: chartKey2,
            size: charSize,
            initialChartData: generateChartData(100, widget.color.withOpacity(.1)),
            chartType: CircularChartType.Radial,
            edgeStyle: SegmentEdgeStyle.round,
            percentageValues: true,
          ),
        ),
        Center(
          child: AnimatedCircularChart(
            key: chartKey,
            size: charSize,
            initialChartData: generateChartData(widget.value, widget.color),
            chartType: CircularChartType.Radial,
            edgeStyle: SegmentEdgeStyle.round,
            percentageValues: true,
            startAngle: 90,
          ),
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
