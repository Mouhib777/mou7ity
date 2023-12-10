import 'package:flutter/material.dart';
import 'package:flutter_application_4/API_services/weather.dart';
import 'package:flutter_application_4/Provider/location_provider.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApi _weatherApi = WeatherApi();

  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    // fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    // currentLocation = LatLng(locationData.latitude, locationData.longitude);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // WeatherApi _weatherApi = WeatherApi();
    void fetchWeatherData() async {
      try {
        var data = await WeatherApi.getWeatherData(
            longitude: locationData.longitude, latitude: locationData.latitude);
        setState(() {
          weatherData = data;
        });
      } catch (e) {
        print('Error fetching weather data: $e');
      }
    }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.03, right: screenWidth * 0.03),
          child: Column(
            children: [
              Center(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: WeatherApi.getWeatherData(
                    latitude: locationData.latitude,
                    longitude: locationData.longitude,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      Map<String, dynamic> weatherData = snapshot.data!;

                      return Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.0, right: screenWidth * 0.0),
                        child: Column(
                          children: [
                            Container(
                              height: screenHeight * 0.2,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                  color: color1,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: screenWidth * 0.05,
                                        right: screenWidth * 0.015),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(
                                        //   height: screenHeight * 0.02,
                                        // ),
                                        Text(
                                          '${weatherData['location']['name']}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        Text(
                                          '${weatherData['current']['condition']['text']}',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.03,
                                        ),
                                        Text(
                                          '${weatherData['current']['temp_c']}°C',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  weatherData['current']['condition']['text'] ==
                                          "Clear"
                                      ? Image.asset(
                                          "assets/images/clear.png",
                                          height: 150,
                                          width: 150,
                                        )
                                      : weatherData['current']['condition']
                                                  ['text'] ==
                                              "Cloudy"
                                          ? Image.asset(
                                              "assets/images/cloudy.png",
                                              height: 150,
                                              width: 150,
                                            )
                                          : weatherData['current']['condition']
                                                      ['text'] ==
                                                  "Rain"
                                              ? Image.asset(
                                                  "assets/images/rain.png",
                                                  height: 150,
                                                  width: 150,
                                                )
                                              : weatherData['current']
                                                              ['condition']
                                                          ['text'] ==
                                                      "Overcast"
                                                  ? Image.asset(
                                                      "assets/images/overcast.png",
                                                      height: 150,
                                                      width: 150,
                                                    )
                                                  : weatherData['current']
                                                                  ['condition']
                                                              ['text'] ==
                                                          "Partly Cloudy"
                                                      ? Image.asset(
                                                          "assets/images/partly-cloud.png",
                                                          height: 150,
                                                          width: 150,
                                                        )
                                                      : weatherData['current']
                                                                      ['condition']
                                                                  ['text'] ==
                                                              "Showers"
                                                          ? Image.asset(
                                                              "assets/images/showers.png",
                                                              height: 150,
                                                              width: 150,
                                                            )
                                                          : weatherData['current']
                                                                          ['condition']
                                                                      ['text'] ==
                                                                  "Thunderstorm"
                                                              ? Image.asset(
                                                                  "assets/images/thunderstorm.png",
                                                                  height: 150,
                                                                  width: 150,
                                                                )
                                                              : Image.asset(
                                                                  "assets/images/rain.png",
                                                                  height: 150,
                                                                  width: 150,
                                                                )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: screenWidth * 0.25,
                                  height: screenWidth * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Wind",
                                          style: GoogleFonts.montserrat(
                                              color: color1,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.01,
                                        ),
                                        Text(
                                          "${weatherData['current']['wind_kph']} km/h",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.25,
                                  height: screenWidth * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Wind Dir",
                                          style: GoogleFonts.montserrat(
                                              color: color1,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.01,
                                        ),
                                        Text(
                                          "${weatherData['current']['wind_dir']}",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: screenWidth * 0.25,
                                  height: screenWidth * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pressure",
                                          style: GoogleFonts.montserrat(
                                              color: color1,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.01,
                                        ),
                                        Text(
                                          "${weatherData['current']['pressure_mb']} mb",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tips",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
