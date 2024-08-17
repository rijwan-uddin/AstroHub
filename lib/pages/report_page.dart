import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  static const String routeName = 'report';

  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: buildLineChart(),
            )
          ],
        ),
      ),
    );
  }

  PieChart buildPieChart() {
    return PieChart(
      PieChartData(sections: generateSections()),
    );
  }

  List<PieChartSectionData> generateSections() {
    return List.generate(
        4,
        (index) => PieChartSectionData(
            title: 'Title ${index + 1}',
            showTitle: true,
            radius: 70.0,
            value: 25.0,
            color: Color.fromARGB(255, 150, 20 * index, 30 * index),
            titleStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            )));
  }

 LineChart buildLineChart() {
    return LineChart(
      LineChartData(
        minX: 0,
        minY: 0,
        maxX: 11,
        maxY: 6,
        lineBarsData: [

          LineChartBarData(
            spots: [
              FlSpot(0, 0.5),
              FlSpot(1, 2),
              FlSpot(2, 2),
              FlSpot(3, 6),
              FlSpot(4, 4),
              FlSpot(5, 5),
              FlSpot(7, 2),
              FlSpot(9, 1),
            ],
            isCurved: true,
            isStrokeCapRound: true,
            barWidth: 4,
            color: Colors.amber,
          )

        ],
      )
    );
 }
}
