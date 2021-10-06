import 'package:flutter/material.dart';
import 'circle.dart';

class value extends StatelessWidget {
  Image graph;
  value(this.graph);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(height: 100, color: Color(0xff91C87C)),
        Column(
          children: [
            Text(
              'This is the carbon content of your field!',
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
