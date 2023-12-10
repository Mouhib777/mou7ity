import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/location_provider.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:line_icons/line_icon.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late LatLng currentLocation;
  late GoogleMapController _mapController;
  bool _locating = false;

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    currentLocation = LatLng(locationData.latitude, locationData.longitude);

    void onCreated(GoogleMapController controller) {
      _mapController = controller;
    }

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: color1,
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 14.4746,
            ),
            zoomControlsEnabled: false,
            compassEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference(1.5, 20.8),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            mapToolbarEnabled: true,
            onCameraMove: (CameraPosition position) {
              setState(() {
                _locating = true;
              });
              locationData.onCameraMove(position);
            },
            onMapCreated: onCreated,
            onCameraIdle: () {
              setState(() {
                _locating = false;
              });
              locationData.getMoveCamera();
            },
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.055),
                    child: LineIcon.mapPin(
                      size: MediaQuery.of(context).size.height * 0.08,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.21,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        // leading: Container(
                        //   height: MediaQuery.of(context).size.height * 0.07,
                        //   width: MediaQuery.of(context).size.height * 0.07,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20),
                        //       color: color2),
                        //   child: LineIcon.truck(
                        //     size: MediaQuery.of(context).size.height * 0.04,
                        //   ),
                        // ),
                        title: Text(
                          _locating ? 'Locating...' : locationData.selectedAddress1.toString(),
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: AbsorbPointer(
                          absorbing: _locating ? true : false,
                          child: Container(
                            width: 170,
                            height: 30,
                            child: ListTile(
                              title: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // User? user = FirebaseAuth.instance.currentUser;
                                    // await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
                                    //   "PickUp_latitude": locationData.latitude,
                                    //   "PickUp_longitude": locationData.longitude,
                                    //   "PickUp_address": locationData.selectedAddress1.toString(),
                                    //   "distance": ""
                                    // });
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _locating ? color1 : color1,
                                    shape: RoundedRectangleBorder(
                                      side: _locating
                                          ? BorderSide(color: Colors.transparent)
                                          : BorderSide(color: Colors.white70),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: _locating ? 0 : 0.5,
                                  ),
                                  child: Text(
                                    _locating ? "" : 'Select',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}