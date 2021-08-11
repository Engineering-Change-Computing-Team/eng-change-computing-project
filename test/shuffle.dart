import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'dart:collection';

class PolyTest {
  // Creates a map, with indexes as keys, from the given list.
  // Returns a map with a shuffled order of the same key value pairs.
  LinkedHashMap<int, LatLng> shufflePolygon(List<LatLng> polygonList) {
    LinkedHashMap<int, LatLng> orderedPoints;
    for (var i = 0; i < polygonList.length; i++) {
      orderedPoints[i] = polygonList[i];
    }

    List<int> list = orderedPoints.keys;
    list.shuffle();
    LinkedHashMap<int, LatLng> shuffleMap = new LinkedHashMap<int, LatLng>();
    list.forEach((element) {
      shuffleMap[element] = orderedPoints[element];
    });

    return shuffleMap;
  }

  // checks if shuffled hash map is in ascending/ closed
  bool checkIfAscending(Map<int, LatLng> shufflePoints) {
    List<int> keysList = shufflePoints.keys;
    for (var i = 1; i < keysList.length; i++) {
      if (keysList[i] != keysList[i - 1] + 1 &&
          keysList[i] != keysList[i - 1] - (keysList.length - 1)) {
        return false;
      }
    }
    return true;
  }

  // Tuple2<List<LatLng>, bool> combinedMethod(List<LatLng> polyList)
  // {

  // }

}
