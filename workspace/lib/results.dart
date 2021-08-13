import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // Provisional result value
  int _totalCarbonMass = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: Complete design of results page.
    return Scaffold(
      appBar: AppBar(
        title: Text('How much carbon you have'),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                'On average you sequest...',
                style: TextStyle(fontSize: 20, color: Colors.red),
              )),
          Expanded(
              flex: 4,
              child: Text(
                '$_totalCarbonMass',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Share Result'),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                  )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: Text('View Breakdown'),
                    style: ElevatedButton.styleFrom(primary: Colors.purple),
                  )),
                ],
              )),
          Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Measure Again'),
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              ))
        ],
      ),
    );
  }
}
