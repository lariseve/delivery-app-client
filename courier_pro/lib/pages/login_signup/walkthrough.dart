// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/login_signup/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool key) {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
        },
        child: Container(
          width: width,
          height: height,
          color: darkBlueColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'CourierPro',
                    style: splashBigTextStyle,
                  ),
                  heightSpace,
                  Text(
                    'Demande de livraison 24x7',
                    style: whiteNormalTextStyle,
                  ),
                ],
              ),
              SizedBox(
                width: width - fixPadding * 4.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getItems('assets/icons/courier.png', 'Send packages',
                        'Récupérez et déposez vos pacquets dans toute la  ville'),
                    heightSpace,
                    heightSpace,
                    getItems('assets/icons/food.png', 'Commandez de la nourriture',
                        'Commandez de la nourriture dans votre restaurant préféré et nous vous la livrerons'),
                    heightSpace,
                    heightSpace,
                    getItems('assets/icons/grocery.png', 'Order grocery',
                        'Commandez vos courses au supermarché ou à l\'épicerie et nous vous les livrerons'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Commencer  with CourierPro',
                      style: blackLargeTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child:  Login()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '+1',
                            style: blackSmallTextStyle,
                          ),
                          widthSpace,
                          widthSpace,
                          Text(
                            'Mettez votre mail',
                            style: greySmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                    heightSpace,
                    Container(
                      width: width - fixPadding * 4.0,
                      height: 1.3,
                      color: greyColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getItems(String image, String title, String desc) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Image.asset(
            image,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.scaleDown,
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        SizedBox(
          width: width - (fixPadding * 4.0 + 70.0 + 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: whiteLargeTextStyle,
              ),
              heightSpace,
              Text(
                desc,
                style: whiteSmallTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
