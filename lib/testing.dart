import 'dart:math' show Random, asin, cos, sqrt;

import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

class Testing extends StatelessWidget {
  Testing({Key key}) : super(key: key);

  var startTime = DateTime.now().millisecondsSinceEpoch;
  List<double> timeLs = [];
  List<List<double>> newData;

  void generateTime() {
    for (int i = 0; i < 8; i++) {
      startTime = startTime + ((Random().nextInt(9) + 1) * 100000);
      timeLs.add(startTime.toDouble());
    }
  }

  void generateData() {
    newData = [
      [28.703368, 77.120495, timeLs[0]],
      [28.702671, 77.121633, timeLs[1]],
      [28.701617, 77.123072, timeLs[2]],
      [28.702342, 77.123737, timeLs[3]],
      [28.703048, 77.124376, timeLs[4]],
      [28.704017, 77.125223, timeLs[5]],
      [28.704770, 77.124192, timeLs[6]],
      [28.707132, 77.126231, timeLs[7]]
    ];
  }

  double calculateDisTime({lat1, long1, lat2, long2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((long2 - long1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    generateTime();
    generateData();

    double totalDistance = 0;
    for (var i = 0; i < newData.length - 1; i++) {
      totalDistance += calculateDisTime(
          lat1: newData[i][0],
          long1: newData[i][1],
          lat2: newData[i + 1][0],
          long2: newData[i + 1][1]);
    }
    double totalTime = newData[newData.length - 1][2] - newData.first[2];
    print('Total Distance : $totalDistance');
    print('Total time: $totalTime');

    return Scaffold(
      appBar: AppBar(
        title: Text('Testing'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Test'),
        ),
      ),
    );
  }
}
