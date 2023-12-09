import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/Auth/login.dart';
import 'package:flutter_application_4/screens/Auth/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (context, animation, secondaryAnimation) =>
              loginScreen()));
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
