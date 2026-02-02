import 'dart:developer';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {

  var userLat = 0.0.obs;
  var userLng = 0.0.obs;

  Future<void> handleLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Permission Denied", "Location access is needed for the alarm.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission Error", "Please enable location from settings.");
      return;
    }
    else {
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      userLat.value = currentPosition.latitude;
      userLng.value = currentPosition.longitude;
      log("Latitude ${currentPosition.latitude.toString()}");
      log("Longitude ${currentPosition.longitude.toString()}");
    }

  }

  void skipToHome() {
    Get.offAllNamed('/home');
  }
}