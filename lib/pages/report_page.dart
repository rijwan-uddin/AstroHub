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
    );
  }
}
