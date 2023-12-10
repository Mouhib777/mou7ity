import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Sensors extends StatefulWidget {
  const Sensors({super.key});

  @override
  State<Sensors> createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.04, right: screenWidth * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  text2,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w800, color: color1),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.09,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.09,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
