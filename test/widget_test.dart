// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'shuffle.dart';
import 'package:first_map_plotter/goomap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_map_plotter/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "dart:math";
import 'dart:collection';

void main() {
  // Four sided Polygons
  List<LatLng> fst4SidedPoly = [
    LatLng(37.42662715095005, -122.08694927394392),
    LatLng(37.42673871112159, -122.08178400993349),
    LatLng(37.42269847614208, -122.08168242126703),
    LatLng(37.423590999690816, -122.0868245512247)
  ];
  List<LatLng> snd4SidedPoly = [
    LatLng(37.055512102288596, -119.31560274213552),
    LatLng(37.05825301734913, -119.26471889019012),
    LatLng(37.029098029729035, -119.26334425806998),
    LatLng(37.00252616446628, -119.30910978466274)
  ];
  // Five sided Polygons
  // Six Sided Polygons

  group('isPolygonSimple_shuffleTest - ', () {
    test(
        'Shuffled polygon list points correctly returns true/ false depending on whether the list indexes are sequential',
        () {
      PolyTest polyTest = PolyTest();

      LinkedHashMap<int, LatLng> shuffledList =
          polyTest.shufflePolygon(fst4SidedPoly);
      bool isSimple = polyTest.checkIfAscending(shuffledList);

      // expect(, );
    });
  });

  // Test isPolygonSimple.
  //  1. create large polygon using map
  //  2. assign index to each point in list - create a map
  //  3. shuffle point list and index list in the same way
  //  4. check if index list is in increasing order
  //  5. if not, ensure isPolygonSimple returns false
  //  6. if yes, ensure isPolygonSimple returns true

  // Test redrawPolygon. Test that changeCoordPos is not null.
  // 1. Shuffle the last point of a simple polygon.
  // 2. Check that isPolygonSimple returns false on list.
  // 3. Call redrawpolygon on list.
  // 4. Check that isPolygonSimple returns true.
}
