import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Locontroller extends GetxController {

  void getCurrentPosition()async{
    LocationPermission permission = await  Geolocator.checkPermission();

    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      log("permission not given");
      LocationPermission asked = await Geolocator.requestPermission();
    }
    else {
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      log("Latitude ${currentPosition.latitude.toString()}");
      log("Longitude ${currentPosition.longitude.toString()}");
    }
  }


}