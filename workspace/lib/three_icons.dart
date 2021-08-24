import 'package:first_map_plotter/goomap.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'results.dart';

class three_icons extends StatelessWidget {
  LocationData locationData;
  three_icons(this.locationData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => GooMap(locationData)));},
                      child: Icon(Icons.sync_outlined, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Color(0xff91C87C), // <-- Button color
                        onPrimary: Colors.yellowAccent, // <-- Splash color
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                        "Test Again",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff91C87C),
                            fontWeight: FontWeight.bold)
                    )
                  ],
                ),
              )
          ),
          Expanded(
              child: Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.api_rounded, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Color(0xff91C87C), // <-- Button color
                        onPrimary: Colors.yellowAccent, // <-- Splash color
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                        "Breakdowns",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff91C87C),
                            fontWeight: FontWeight.bold)
                    )
                  ],
                ),
              )
          ),
          Expanded(
              child: Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.share, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Color(0xff91C87C), // <-- Button color
                        onPrimary: Colors.yellowAccent, // <-- Splash color
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                        "Share",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff91C87C),
                            fontWeight: FontWeight.bold)
                    )
                  ],
                ),
              )
          ),
        ],

      ),
    );
  }
}
