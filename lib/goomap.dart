import 'dart:collection';
import 'package:tuple/tuple.dart';
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

  int getIntersectionIndex(List<LatLng> poly) {
    Segment lastLine = Segment(poly.last, poly[0]);
    Segment penultimateLine = Segment(poly[poly.length - 2], poly.last);

    for (var i = 0; i < poly.length; i++) {
      Segment test = Segment(poly[i], poly[i + 1]);
      if (test.intersectsWith(lastLine) ||
          test.intersectsWith(penultimateLine)) {
        print("--------------------------");
        print("***********INTERSECTION INDEX IS: $i");
        print("--------------------------");
        return i;
      }
    }
    return -1;
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
      visible: polygonLatLngs.length >= 4,
    );
  }

  // Check if Polygon is simple
  // TODO: Complete isPolygonSimple function following steps below.
  Tuple2 isPolygonSimple(List<LatLng> poly) {
    // -1 means that the 2nd element of the tuple is invalid
    if (poly.length < 4) {
      Tuple2 hi = Tuple2<bool, int>(true, -1);
      return hi;
    }

    // Initialise the lines list
    List<Segment> lines = [];
    Segment penulLine = Segment(poly[poly.length - 2], poly[poly.length - 1]);
    Segment lastLine = Segment(poly[poly.length - 1], poly[0]);
    for (int i = 0; i < poly.length - 1; i++) {
      Segment line = Segment(poly[i], poly[i + 1]);
      if (lines.length > 1) {
        for (int j = 0; j < lines.length; j++) {
          // ...int index = getIntersectionIndex(poly);
          if (line.intersectsWith(penulLine)) {
            return Tuple2(false, getIntersectionIndex(poly));
          } else if (line.intersectsWith(lastLine)) {
            return Tuple2(false, getIntersectionIndex(poly));
          }
        }
      }
      lines.add(line);
    }

    return Tuple2(true, -1);

    // 1) Create a list of all of the line segments in the polygon.
    // Every consecutive pair from the list forms a line segment.
    // Create these line segments using the segments class constructor
    // i.e. Segment(startPoint, endPoint).
    // 2) Check for each line segment whether it intersects with any of the other
    // line segments from the
    // Use the intersectsWith method from the Segment class.
    // 3) If any of the line segements do intersect with a line return false,
    // otherwise return true.
  }

  void redrawPolygon(List<LatLng> poly, int changeCoordPos) {
    // The most recent and penultimate point form a segment that intersects
    // The last point becomes the (changeCoordPos)th point and points after the (change) point
    // Are shifted by one to the right.

    LatLng lastPoint = poly[polygonLatLngs.length - 1];
    poly.remove(lastPoint);
    poly.insert(changeCoordPos, lastPoint);
    //for (int i = changeCoordPos; i < polygonLatLngs.length - 1; i++) {}
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

                Tuple2 isSimpleTuple = isPolygonSimple(polygonLatLngs);

                bool isSimple = isSimpleTuple.item1;
                int pos = isSimpleTuple.item2;
                print("************LIST: $polygonLatLngs");
                print("************TUPLE_ITEM1: $isSimple");
                print("************TUPLE_ITEM2: $pos");

                // This is the position of the start of the line segment which
                // intersects with the last line segment.
                int changeCoordPos;
                if (isSimpleTuple.item2 != -1) {
                  changeCoordPos = isSimpleTuple.item2;
                }

                // If the Polygon is not simple we can redraw the Polygon
                // to create an enclosed shape and use it instead.
                if (isSimple) {
                  _setSimplePolygon();
                } else {
                  redrawPolygon(polygonLatLngs, changeCoordPos);
                  print("*******POLYGON IS NOT SIMPLE");
                  print("*******REORDERED LIST: $polygonLatLngs");
                  _setSimplePolygon();
                }
                /*print("---------------------------------------");
                print("The polygon has no self-intersecting lines: $isSimple");
                print(polygonLatLngs);
                print("---------------------------------------");
                if (polygonLatLngs.length < 4) {
                  _setBasicPolygon();
                } else if (isPolygonSimple(polygonLatLngs).item1) {
                  _setSimplePolygon();
                } else {
                  _setInvalidPolygon();
                }*/
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
