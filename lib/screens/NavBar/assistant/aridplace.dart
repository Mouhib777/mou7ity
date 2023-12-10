import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/NavBar/assistant/addPlace.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AridPlace extends StatefulWidget {
  const AridPlace({super.key});

  @override
  State<AridPlace> createState() => _AridPlaceState();
}

class _AridPlaceState extends State<AridPlace> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                pushNewScreenWithRouteSettings(context,
                    screen: AddPlace(),
                    settings: RouteSettings(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.01, right: screenHeight * 0.01),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                height: screenHeight * 0.42,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: color2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 0.5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/licensed-image.jpeg",
                        width: 370,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      "Our town seeks a green makeover, envisioning transformed empty spaces into vibrant, sustainable landscapes for a thriving community.",
                      style: GoogleFonts.montserrat(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
