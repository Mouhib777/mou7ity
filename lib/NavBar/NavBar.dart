import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/NavBar/Weather.dart';
import 'package:flutter_application_4/screens/NavBar/assistant.dart';
import 'package:flutter_application_4/screens/NavBar/chat.dart';
import 'package:flutter_application_4/screens/NavBar/home.dart';
import 'package:flutter_application_4/screens/NavBar/sensors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class navBar extends StatefulWidget {
  final int initialPage;


  const navBar({
    super.key,
    required this.initialPage
  });

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: widget.initialPage);
    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        WeatherScreen(),
        Assistant(),
        Sensors(),
       ChatScreen()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          iconSize: 30,
          icon: LineIcon.tree(),
          title: "Home",
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.cloud(),
          title: "Weather",
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.helpingHands(),
          title: "Assistant",
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.medicalNotes(),
          title: "Sensors",
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.peopleCarry(),
          title: "Community",
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
      ];
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: PersistentTabView(
        context,
        navBarHeight: 60,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: false,
          curve: Curves.elasticInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      )),
    );
  }
}
