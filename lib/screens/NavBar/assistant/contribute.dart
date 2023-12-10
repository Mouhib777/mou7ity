import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contribute extends StatefulWidget {
  const Contribute({super.key});

  @override
  State<Contribute> createState() => _ContributeState();
}

class _ContributeState extends State<Contribute> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Something greened!",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.01, right: screenWidth * 0.01),
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/azerty.png")),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/ok.png"))
          ],
        )),
      ),
    );
  }
}
