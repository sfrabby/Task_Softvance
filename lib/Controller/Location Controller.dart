import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class LocationController extends GetxController {

  // লোকেশন পারমিশন হ্যান্ডেল করার ফাংশন
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

    // পারমিশন ঠিক থাকলে হোম স্ক্রিনে নিয়ে যাবে
    Get.offAllNamed('/home');
  }

  void skipToHome() {
    Get.offAllNamed('/home');
  }
}