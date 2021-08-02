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

  Segment(this._start, this._end);

  LatLng getStartPoint() {
    return _start;
  }

  LatLng getEndPoint() {
    return _end;
  }

  // Returns true if the given line segment intersects with the
  // other line segment given as an argument.
  bool intersectsWith(Segment other) {
    // If there is a point of intersection it will lie within an interval, ia,
    ExclusiveInterval ia;
    // We must first check that this interval exists.
    if (max(_start.latitude, _end.latitude) <
        max(other._start.latitude, other._end.latitude)) {
      return false;
    } else {
      ia = ExclusiveInterval(
          max(min(_start.latitude, _end.latitude),
              min(other._start.latitude, other._end.latitude)),
          min(max(_start.latitude, _end.latitude),
              max(other._start.latitude, other._end.latitude)));
    }

    // Now we have two line formulas, with mutual intervals:
    // f1(x) = y = a1*x + b1
    // f2(x) = y = a2*x + b2
    double a1 =
        (_start.longitude - _end.longitude) / (_start.latitude - _end.latitude);
    double a2 = (other._start.longitude - other._end.longitude) /
        (other._start.latitude - other._end.latitude);
    double b1 = (_start.longitude) - a1 * (_start.latitude);
    double b2 = (other._start.longitude) - a2 * (other._start.latitude);

    // If the segments are parallel, then they will not intersect.
    // a1 and a2 correspond to the gradients of the lines
    if (a1 == a2) {
      return false;
    }

    // Let the potential point of intersection be (xa, ya).
    double xa = (b2 - b1) / (a1 - a2);

    // This point of intersection is still 'potential' because it may
    // not be within the interval ia.
    // Below we check that xa is within the mutual interval.
    if (ia.contains(xa)) {
      return true;
    } else {
      return false;
    }
  }
}
