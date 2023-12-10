import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/NavBar/NavBar.dart';
import 'package:flutter_application_4/Provider/location_provider.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/Auth/login.dart';
import 'package:flutter_application_4/screens/Auth/welcome.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () async {
      final locationData =
          Provider.of<LocationProvider>(context, listen: false);
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      await locationData.getCurrentPosition();
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation, secondaryAnimation) =>
                  loginScreen()));
        } else {
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: Duration.zero,
              pageBuilder: (context, animation, secondaryAnimation) => navBar(
                    initialPage: 0,
                  )));
        }
      });
      // Navigator.of(context).push(PageRouteBuilder(
      //     transitionDuration: Duration.zero,
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         loginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Text(
              "Mou7iti",
              style: GoogleFonts.montserrat(
                  color: color1,
                  fontSize: 20,
                  letterSpacing: 6,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "محيطي",
              style: GoogleFonts.montserrat(
                  color: color1,
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
