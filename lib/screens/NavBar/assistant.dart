import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Assistant extends StatefulWidget {
  const Assistant({super.key});

  @override
  State<Assistant> createState() => _AssistantState();
}

class _AssistantState extends State<Assistant> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.04, right: screenWidth * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Text(
                  text1,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w800, color: color1),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.09,
                ),
                InkWell(
                  onTap: () {
                    print("1");
                  },
                  child: Container(
                    height: screenHeight * 0.2,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: color1,
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4),
                                BlendMode.colorBurn),
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/background/background1.jpg")),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Arid places founded by community",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                InkWell(
                  onTap: () {
                    print("2");
                  },
                  child: Container(
                    height: screenHeight * 0.2,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: color1,
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.colorBurn),
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/background/background2.jpeg")),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Share and discuss your worries with the community.",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                InkWell(
                  onTap: () {
                    print("3");
                  },
                  child: Container(
                    height: screenHeight * 0.2,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: color1,
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.colorBurn),
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/background/background3.jpg")),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Contribute your solution to benefit the community.",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
