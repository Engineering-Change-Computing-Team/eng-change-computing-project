import 'package:location/location.dart';
import 'package:flutter/material.dart';

class MyChartPage extends StatefulWidget {
  @override
  _MyChartPageState createState() => _MyChartPageState();
}

class _MyChartPageState extends State<MyChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
                'assets/images/graph.png',
                height: 200,
              ),
    ));
}
