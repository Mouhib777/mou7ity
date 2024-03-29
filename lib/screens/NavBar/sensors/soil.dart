import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class SoilScreen extends StatefulWidget {
  const SoilScreen({super.key});

  @override
  State<SoilScreen> createState() => _SoilScreenState();
}

class _SoilScreenState extends State<SoilScreen> {
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
            children: [
              Image.asset("assets/images/soilSensor.png"), 
              SizedBox(height: screenHeight*0.02,) , 
              Text("Last value: 780", 
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