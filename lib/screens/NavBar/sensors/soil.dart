import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoilScreen extends StatefulWidget {
  const SoilScreen({super.key});

  @override
  State<SoilScreen> createState() => _SoilScreenState();
}

class _SoilScreenState extends State<SoilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soil Sensor", 
        style: GoogleFonts.montserrat(

        ),
        
        ),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          children: [
            Image.asset("assets/images/soilSensor.png")
          ],
        ),
      )
    ); 
  }
}