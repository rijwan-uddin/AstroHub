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
              child: PieChart(
                PieChartData(
                  sections: generateSections(
                    
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

 List<PieChartSectionData> generateSections() {
    return List.generate(4, (index) => PieChartSectionData(
      title: 'Title ${index + 1}',
      showTitle: true,
      radius: 70.0,
      value: 25.0,
      color: Color.fromARGB(255, 150, 20 * index, 30 * index),
      titleStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      )

    ));
 }
}
