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

  /*bool CCW(LatLng p1, LatLng p2, LatLng p3) {
    return (p3.longitude - p1.longitude) * (p2.latitude - p1.latitude) >
        (p2.longitude - p1.longitude) * (p3.latitude - p1.latitude);
  }

  bool intersectsWith(Segment other) {
    LatLng p1 = _start;
    LatLng p2 = _end;
    LatLng p3 = other._start;
    LatLng p4 = other._end;

    return (CCW(p1, p3, p4) != CCW(p2, p3, p4)) &&
        (CCW(p1, p2, p3) != CCW(p1, p2, p4));
  }*/

  // returns true if the line from (a,b)->(c,d) intersects with (p,q)->(r,s)
  bool intersectsWith(Segment other) {
    // (a, b) is _start
    // (c, d) is _end
    // (p, q) is other._start
    // (r, s) is other._end
    var a = _start.longitude;
    var b = _start.latitude;
    var c = _end.longitude;
    var d = _end.latitude;
    var p = other._start.longitude;
    var q = other._start.latitude;
    var r = other._end.longitude;
    var s = other._end.latitude;

    var det, gamma, lambda;
    det = (c - a) * (s - q) - (r - p) * (d - b);
    if (det == 0) {
      return false;
    } else {
      lambda = ((s - q) * (r - a) + (p - r) * (s - b)) / det;
      gamma = ((b - d) * (r - a) + (c - a) * (s - b)) / det;
      return (0 < lambda && lambda < 1) && (0 < gamma && gamma < 1);
    }
  }
}
