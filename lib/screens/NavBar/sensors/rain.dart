import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class RainGauge extends StatefulWidget {
  const RainGauge({super.key});

  @override
  State<RainGauge> createState() => _RainGaugeState();
}

class _RainGaugeState extends State<RainGauge> {
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
              Image.asset("assets/images/rainn.png"), 
              SizedBox(height: screenHeight*0.02,) , 
              Text("Last value: 6.285", 
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