import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:geocoding/geocoding.dart';

@override
class LocationProvider with ChangeNotifier {
  late double latitude;
  late double longitude;
  bool permissionAllowed = false;
  var selectedAddress;
  var selectedAddress1;
  late String? featureName;
  late String? AddressLine;
  late LocatitonGeocoder geocoder =
  LocatitonGeocoder('AIzaSyCYlAMoClph7HKh_2fifwjdBiEb1wRDZZQ');
  // 'AIzaSyCYlAMoClph7HKh_2fifwjdBiEb1wRDZZQ'
      // LocatitonGeocoder('AIzaSyBJbMNZL8jVucd7EJQu9uvzycVRxOaIaPo');

  Future<void> getCurrentPosition() async {
    Future<Position> getLocation() async {
      // Test if location services are enabled.
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          return Future.error(
              Exception('Location permissions are permanently denied.'));
        }

        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error(Exception('Location permissions are denied.'));
        }
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // ignore: unnecessary_null_comparison
    if (position != null) {
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      this.permissionAllowed = true;
      // ignore: unused_local_variable
      final coordinates = Coordinates(this.latitude, this.longitude);
      // ignore: unused_local_variable
      var addresses = await geocoder.findAddressesFromCoordinates(
          Coordinates(this.latitude, this.longitude));

      this.permissionAllowed = true;
      notifyListeners();
    } else {
      print('Permission NOT ALLOWED');
    }
  }

  void onCameraMove(CameraPosition cameraPosition) async {
    this.latitude = cameraPosition.target.latitude;
    this.longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  Future<void> getMoveCamera() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];

    String address1 =
        '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(address1);

    this.selectedAddress1 = address1;
  }
}