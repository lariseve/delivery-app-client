// ignore_for_file: library_private_types_in_public_api

import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/courier/get_food_deliver.dart';
import 'package:courier_pro/pages/courier/get_grocery_deliver.dart';
import 'package:courier_pro/pages/courier/send_packages.dart';
import 'package:courier_pro/pages/invite_friend/invite_friend.dart';
import 'package:courier_pro/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: Text('Bienvenue a  Courier Pro', style: appBarTextStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: primaryColor),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const Profile()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Image.asset(
              'assets/banner.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          heightSpace,
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                      child: const InviteFriend()));
            },
            child: Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              color: lightPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/wallet.png',
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.fitHeight,
                      ),
                      widthSpace,
                      SizedBox(
                        width: width - (fixPadding * 4.0 + 35.0 + 30.0 + 10.0),
                        child: Text(
                            'Invitez des amis sur Courier Pro pour gagner jusqu\'à 20 \$ Courier Pro Cash',
                            style: blackSmallTextStyle),
                      ),
                    ],
                  ),
                  Container(
                    width: 30.0,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios,
                        color: greyColor, size: 18.0),
                  ),
                ],
              ),
            ),
          ),

          // Courier Type Start

          // Send Packages Start
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SendPackages()));
            },
            child: Hero(
              tag: 'Envoyer des colis',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/courier.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    SizedBox(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Send Packages',
                              style: primaryColorHeadingTextStyle),
                          Text('Envoyez des colis n\'importe où et à tout moment.',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Send Packages Start

          // Food Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetFoodDeliver()));
            },
            child: Hero(
              tag: 'Faites-vous livrer de la nourriture',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/food.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    SizedBox(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Faites-vous livrer de la nourriture',
                              style: primaryColorHeadingTextStyle),
                          Text('Commandez de la nourriture et nous vous la livrerons.',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Food Deliver Start

          // Grocery Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetGroceryDeliver()));
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: fixPadding * 2.0,
                  right: fixPadding * 2.0,
                  left: fixPadding * 2.0),
              padding: EdgeInsets.all(fixPadding * 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: whiteColor,
                border: Border.all(width: 0.2, color: primaryColor),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 1.5,
                    spreadRadius: 1.5,
                    color: primaryColor.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: primaryColor.withOpacity(0.2),
                    ),
                    child: Image.asset(
                      'assets/icons/grocery.png',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  widthSpace,
                  SizedBox(
                    width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Faites-vous livrer vos courses',
                            style: primaryColorHeadingTextStyle),
                        Text(
                            'Commandez vos courses dans votre magasin préféré et nous vous les livrerons.',
                            style: greySmallTextStyle)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Grocery Deliver Start
          // Courier Type End
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }
}
