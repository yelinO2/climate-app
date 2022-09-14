import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  dynamic latitude;
  dynamic longitude;
  getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      debugPrint('>>>>>>>>>');
      debugPrint(permission.toString());
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      debugPrint('>>>>>>>>>');
      debugPrint(location.toString());

      latitude = location.latitude;
      longitude = location.longitude;
    } catch (e) {
      debugPrint('>>>>>>>>>');
      debugPrint(e.toString());
    }
  }
}
