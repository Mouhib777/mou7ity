import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Provider/location_provider.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/firebase_options.dart';
import 'package:flutter_application_4/screens/Splash/SplashScreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => LocationProvider(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    Color myColor = color1;

    MaterialColor myThemeColor = MaterialColor(
      myColor.value,
      <int, Color>{
        50: myColor.withOpacity(0.1), 
        100: myColor.withOpacity(0.2),
        200: myColor.withOpacity(0.3),
        300: myColor.withOpacity(0.4),
        400: myColor.withOpacity(0.5),
        500: myColor.withOpacity(0.6),
        600: myColor.withOpacity(0.7),
        700: myColor.withOpacity(0.8),
        800: myColor.withOpacity(0.9),
        900: myColor.withOpacity(1.0),
      },
    );
    ThemeData myTheme = ThemeData(
      primarySwatch: myThemeColor,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mou7iti',
      theme: myTheme,
      builder: EasyLoading.init(),
      home: SplashScreen(),
    );
  }
}

