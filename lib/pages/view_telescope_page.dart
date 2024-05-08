import 'package:flutter/material.dart';

class ViewTelescopePage extends StatefulWidget {
  static const String routeName = 'viewtelescope';
  const ViewTelescopePage({super.key});

  @override
  State<ViewTelescopePage> createState() => _ViewTelescopePageState();
}

class _ViewTelescopePageState extends State<ViewTelescopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('View Telescope'),
      ),

    );
  }
}
