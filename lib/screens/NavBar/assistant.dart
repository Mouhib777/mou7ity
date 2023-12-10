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
    return  SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.04, right: screenHeight*0.04),
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.05,),
                Text(text1,style: GoogleFonts.montserrat(
                  fontSize: 15, 
                  fontWeight: FontWeight.w800 , 
                  color: color1
                ), 
                textAlign: TextAlign.center,
                ) , 
                SizedBox(height: screenHeight*0.1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}