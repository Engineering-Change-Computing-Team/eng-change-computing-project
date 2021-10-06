import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'value.dart';
import 'three_icons.dart';

class ResultPage extends StatefulWidget {
  final LocationData location;
  final Image graph;
  ResultPage(this.location, this.graph);

  @override
  _ResultPageState createState() => _ResultPageState(graph);
}

class _ResultPageState extends State<ResultPage> {
  LocationData locationData;
  Image graph;

  _ResultPageState(this.graph);

  @override
  void initState() {
    super.initState();
    locationData = widget.location;
  }

  // Provisional result value
  int _totalCarbonMass = 1000;

  @override
  Widget build(BuildContext context) {
    // TODO: Complete design of results page.
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Color(0xff91C87C),
          ),
          value(graph),
          Container(
              child: Center(
            child: graph,
          )),
          SizedBox(
            height: 50,
          ),
          three_icons(locationData)
        ])));
  }
}
