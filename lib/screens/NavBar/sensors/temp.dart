import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
 Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text("Soil Sensor", 
        //   style: GoogleFonts.montserrat(
    
        //   ),
          
        //   ),
        //   centerTitle: true,
        // ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/temp.png", 
              height: 200,
              ), 
              SizedBox(height: screenHeight*0.02,) , 
              Text("Last value", 
              style: GoogleFonts.montserrat(
                color: color1, 
                fontWeight: FontWeight.bold , 
                fontSize: 18
              ),
              )
            ],
            
          ),
        )
      ),
    ); 
  }
}