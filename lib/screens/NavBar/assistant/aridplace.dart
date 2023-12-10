import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/NavBar/assistant/addPlace.dart';
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
    );
  }
}
