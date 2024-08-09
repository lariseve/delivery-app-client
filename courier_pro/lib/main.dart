import 'package:courier_pro/appBehaviour/my_behaviour.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courier Pro User',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        fontFamily: 'Mukta',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: greyColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      home: const SplashScreen(),
    );
  }
}
