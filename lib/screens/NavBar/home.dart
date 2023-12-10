import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Mou7iti",
          style: GoogleFonts.montserrat(
              fontSize: 25, color: color1, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.02, right: screenHeight * 0.02),
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight*0.24, 
              decoration: BoxDecoration(
                color: color1.withOpacity(0.95), 
                borderRadius: BorderRadius.circular(20) , 
                border: Border.all(color: color2)
              ),
            )
          ],
        ),
      ),
    );
  }
}
