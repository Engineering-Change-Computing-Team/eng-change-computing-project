import 'package:first_map_plotter/goomap.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Initialising Location Data
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  // Check Location Permissions and get my location
  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Complete design of home page.
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        // Transition to map page
        onPressed: () => _locationData != null
            ? Navigator.push(context,
                MaterialPageRoute(builder: (context) => GooMap(_locationData)))
            : null,
        label: Row(
          children: [
            Text(
              'Open maps',
              style: TextStyle(color: Colors.black87),
            ),
            Icon(
              Icons.map,
              color: Colors.black87,
            )
          ],
        ),
      ),
      body: CustomPaint(
        painter: CirclePainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo here
              Image.asset(
                'assets/images/eclogo.jpeg',
                height: 200,
              ),
              SizedBox(
                height: 220,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff91C07C)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(size.width * 0.5, 800), 300, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
