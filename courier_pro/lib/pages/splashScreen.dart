// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';

import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/login_signup/walkthrough.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WalkThrough()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Padding(
        padding: EdgeInsets.all(fixPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CourierPro',
                style: splashBigTextStyle,
              ),
              heightSpace,
              Text(
                'on-demand delivery available 24x7',
                style: whiteNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
