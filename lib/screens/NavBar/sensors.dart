import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/NavBar/sensors/soil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
                    InkWell(
                      onTap: () {
                        pushNewScreenWithRouteSettings(context,
                              screen: SoilScreen(),
                              settings: RouteSettings(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino);
                      },
                      child: Container(
                        height: screenWidth * 0.35,
                        width: screenWidth * 0.35,
                        decoration: BoxDecoration(
                            color: color1.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            "Soil Moisture Sensor",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                           child: Center(
                        child: Text(
                          "Rain Gauge Sensor",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                      child: Center(
                        child: Text(
                          "TemperatureHumidity Sensor",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                          
                    ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                           child: Center(
                        child: Text(
                          "Solar Radiation Sensor",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                           child: Center(
                        child: Text(
                          "Leaf Wetness Sensor",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.35,
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                          color: color1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                           child: Center(
                        child: Text(
                          "pH Sensor",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
