import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExclusiveInterval {
  // This interval is 'exclusive' in the sense that
  // when checking if a given element
  // is within the interval it cannot be a value
  // that is equivalent to one of the endpoints.
  double _lowerBound;
  double _upperBound;

  ExclusiveInterval(this._lowerBound, this._upperBound);

  bool contains(double element) {
    if ((_lowerBound < element) && (_upperBound < element)) {
      return true;
    } else {
      return false;
    }
  }
}
