import 'dart:math';
import 'ExclusiveInterval.dart';
import 'package:collection/collection.dart';
import 'package:flutter/animation.dart';
import 'dart:collection';
import 'package:math_expressions/math_expressions.dart' as math;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Segment {
  LatLng _start;
  LatLng _end;

  Segment(LatLng start, LatLng end) {
    assert(start != null);
    assert(end != null);
    _start = start;
    _end = end;
  }

  LatLng getStartPoint() {
    return _start;
  }

  LatLng getEndPoint() {
    return _end;
  }

  @override
  String toString() {
    String start = _start.toString();
    String end = _end.toString();
    // TODO: implement toString
    return "Segment($start, $end)";
  }

  bool CCW(LatLng p1, LatLng p2, LatLng p3) {
    return (p3.latitude - p1.latitude) * (p2.longitude - p1.longitude) >
        (p2.latitude - p1.latitude) * (p3.longitude - p1.longitude);
  }

  bool intersectsWith(Segment other) {
    LatLng p1 = _start;
    LatLng p2 = _end;
    LatLng p3 = other._start;
    LatLng p4 = other._end;

    return (CCW(p1, p3, p4) != CCW(p2, p3, p4)) &&
        (CCW(p1, p2, p3) != CCW(p1, p2, p4));
  }
}
