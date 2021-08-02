import 'dart:collection';
import 'segment.dart';
import 'package:collection/collection.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:first_map_plotter/results.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Expect this to receive the location data from the main page
class GooMap extends StatefulWidget {
  final LocationData location;
  GooMap(this.location);

  @override
  _GooMapState createState() => _GooMapState();
}

class _GooMapState extends State<GooMap> {
  // Location
  LocationData _locationData;

  //Polygon initial set up
  Set<Polygon> _polygons = HashSet();
  List<LatLng> polygonLatLngs = [];

  //ids
  int _polygonIdCounter = 1;

  //Type controllers
  bool _isPolygon = false; //Default

  @override
  void initState() {
    super.initState();
    _locationData = widget.location;
  }

  // The results button that will appear if an appropiate Polygon is selected
  // Right now, the Polygon is 'appropriate' if it has 4 or more points.
  // TODO: (Backend) make 'appropriate' - 4 or more points and an enclosed area.
  Visibility resultsButton() {
    // TODO: Complete the design of the results button.
    return Visibility(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultPage()));
        },
        child: Text(
          'See results',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      visible: polygonLatLngs.length >= 4 && isPolygonSimple(polygonLatLngs),
    );
  }

  // Check if Polygon is simple
  // TODO: Complete isPolygonSimple function following steps below.
  bool isPolygonSimple(List<LatLng> poly) {
    // 1) Create a list of all of the line segments in the polygon.
    // Every consecutive pair from the list forms a line segment.
    // Create these line segments using the segments class constructor
    // i.e. Segment(startPoint, endPoint).
    // 2) Check for each line segment whether it intersects with any of the other
    // line segments from the
    // Use the intersectsWith method from the Segment class.
    // 3) If any of the line segements do intersect with a 3rd line return false,
    // otherwise return true.
    return true;
  }

  // Draw this type of Polygon to the map if it has less than 3 points.
  void _setBasicPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15)));
  }

  // Draw this type of Polygon to the map if it has more than 3 points and is simple.
  void _setSimplePolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        strokeColor: Colors.green,
        fillColor: Colors.green.withOpacity(0.5)));
  }

  // Draw this type of Polygon to the map if it is self-intersecting and has more than 3 points.
  void _setInvalidPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        strokeColor: Colors.red,
        fillColor: Colors.red.withOpacity(0.15)));
  }

  // Removes the last point set at the Polygon
  Widget _removePolygonPoint() {
    return FloatingActionButton.extended(
      onPressed: () {
        setState(() {
          polygonLatLngs.removeLast();
        });
      },
      icon: Icon(Icons.undo),
      label: Text('Undo point '),
      backgroundColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Improve design of appbar.
      appBar: AppBar(
        title: Text('Where is your farmland?'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      //The button to remove a polygon point appears once you begin creating a polygon
      floatingActionButton: polygonLatLngs.length > 0 && _isPolygon
          ? _removePolygonPoint()
          : null,
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(_locationData.latitude, _locationData.longitude),
            zoom: 16,
          ),
          mapType: MapType.hybrid,
          polygons: _polygons,
          myLocationEnabled: true,
          onTap: (point) {
            if (_isPolygon) {
              setState(() {
                polygonLatLngs.add(point);
                if (polygonLatLngs.length == 4) {
                  _polygonIdCounter++;
                }
                print(polygonLatLngs);
                if (polygonLatLngs.length < 4) {
                  _setBasicPolygon();
                } else if (isPolygonSimple(polygonLatLngs)) {
                  _setSimplePolygon();
                } else {
                  _setInvalidPolygon();
                }
              });
            }
          },
        ),
        // LAYER OF BUTTONS
        Align(
          // TODO: Align the two buttons in the bottom left.
          // TODO: Complete design of 'Map Polygon' button
          alignment: Alignment.bottomLeft,
          child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                  onPressed: () {
                    _isPolygon = true;
                  },
                  child: Text(
                    'Map Polygon',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              resultsButton(),
            ],
          ),
        )
      ]),
    );
  }
}
