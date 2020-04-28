import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

List<double> _generateRandomData(int count) {
  List<double> result = <double>[];
  for (int i = 0; i < count; i++) {
    result.add(random.nextDouble() * 100);
  }
  return result;
}

/* TO DO: implement sync with database to get the data for chart */

class AnalyticsData {
  final DateTime date;
  final double amount;

  AnalyticsData(this.date, this.amount);
}

class AnalyticsChart extends StatelessWidget{

  var data = _generateRandomData(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
          child: new Container(
            width: 500.0,
            height: 800.0,
            child: new Sparkline(
              data: data,
              lineColor: Colors.lightGreen[500],
              fillMode: FillMode.below,
              fillColor: Colors.lightGreen[200],
              pointsMode: PointsMode.all,
              pointSize: 5.0,
              pointColor: Colors.amber,
            ),
          ),
        ),
      );
  }

}