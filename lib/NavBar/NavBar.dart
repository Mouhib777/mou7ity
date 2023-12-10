import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/NavBar/Weather.dart';
import 'package:flutter_application_4/screens/NavBar/assistant.dart';
import 'package:flutter_application_4/screens/NavBar/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class navBar extends StatefulWidget {
  final int initialPage;
  final String token;
  // final String? name;
  const navBar({
    super.key,
    required this.initialPage,
    required this.token,
    // required this.name,
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
        Assistant()
        WalletScreen(
          token: widget.token,
        ),
        ProfileScreen(
          user_token: widget.token,
        )
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          iconSize: 30,
          icon: LineIcon.home(),
          title: (AppLocalizations.of(context)!.translate('home')),
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.telegram(),
          title: (AppLocalizations.of(context)!.translate("send shipment")),
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.box(),
          title: (AppLocalizations.of(context)!.translate("shipment")),
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.wallet(),
          title: (AppLocalizations.of(context)!.translate("wallet")),
          textStyle: GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          activeColorPrimary: color1,
          inactiveColorPrimary: color2,
        ),
        PersistentBottomNavBarItem(
          iconSize: 32,
          icon: LineIcon.user(),
          title: (AppLocalizations.of(context)!.translate("profile")),
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
