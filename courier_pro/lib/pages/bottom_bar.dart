// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/home/home.dart';
import 'package:courier_pro/pages/notifications/notifications.dart';
import 'package:courier_pro/pages/orders/orders.dart';
import 'package:courier_pro/pages/search/search.dart';
import 'package:courier_pro/pages/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int? currentIndex;
  DateTime? currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        hasNotch: false,
        currentIndex: currentIndex!,
        onTap: changePage,
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          opacity: 0.2,
        ),
        items: [
          BottomBarItem(
            icon: Icon(
              Icons.home,
              color: greyColor,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            backgroundColor: primaryColor,
            title: Text(
              'Home',
              style: bottomBarItemStyle,
            ),
          ),
          BottomBarItem(
            icon: Icon(
              Icons.search,
              color: greyColor,
            ),
            selectedIcon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            backgroundColor: primaryColor,
            title: Text(
              'Search',
              style: bottomBarItemStyle,
            ),
          ),
          BottomBarItem(
            icon: Icon(
              Icons.local_mall,
              color: greyColor,
            ),
            selectedIcon: Icon(
              Icons.local_mall,
              color: primaryColor,
            ),
            backgroundColor: primaryColor,
            title: Text(
              'Orders',
              style: bottomBarItemStyle,
            ),
          ),
          BottomBarItem(
            icon: Icon(
              Icons.notifications,
              color: greyColor,
            ),
            selectedIcon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            backgroundColor: primaryColor,
            title: Text(
              'Notifications',
              style: bottomBarItemStyle,
            ),
          ),
          BottomBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
              color: greyColor,
            ),
            selectedIcon: Icon(
              Icons.account_balance_wallet,
              color: primaryColor,
            ),
            backgroundColor: primaryColor,
            title: Text(
              'Wallet',
              style: bottomBarItemStyle,
            ),
          ),
        ],
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool key) {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
        },
        child: (currentIndex == 0)
            ? const Home()
            : (currentIndex == 1)
                ? const Search()
                : (currentIndex == 2)
                    ? const Orders()
                    : (currentIndex == 3)
                        ? const Notifications(
                            backButton: false,
                          )
                        : const Wallet(),
      ),
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
