import 'package:flutter/material.dart';
import 'circle.dart';

class value extends StatelessWidget {
  const value({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        CustomPaint(
            painter: CirclePainter()
        ),
        Column( children: [
          Text(
            'Congratulations! \n Your field contains',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '1000',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 120,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'KgCO2',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
        )
      ],
    );
  }
}
