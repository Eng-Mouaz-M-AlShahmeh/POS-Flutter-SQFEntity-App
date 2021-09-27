// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/home/home.dart';
import 'package:sells_app/screens/home/login.dart';
import 'package:sells_app/services/provider/app_provider.dart';

Container bottomNavBar(BuildContext context) {
  var appProvider = context.watch<AppProvider>();
  var screenWidth = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.white,
    height: 60,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              child: Icon(
                Icons.house,
                size: 35,
              ),
              style: OutlinedButton.styleFrom(
                primary: appProvider.bottomNavBarIndex == 0
                    ? appTheme.primaryColor
                    : buttonColorRegular,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              onPressed: () {
                appProvider.setBottomNavBarIndex(0);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Expanded(
            child: TextButton(
              child: Icon(
                Icons.notifications,
                size: 35,
              ),
              style: OutlinedButton.styleFrom(
                primary: appProvider.bottomNavBarIndex == 1
                    ? appTheme.primaryColor
                    : buttonColorRegular,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              onPressed: () {
                appProvider.setBottomNavBarIndex(1);
              },
            ),
          ),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Expanded(
            child: TextButton(
              child: Icon(
                Icons.logout,
                size: 35,
              ),
              style: OutlinedButton.styleFrom(
                primary: buttonColorRegular,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
              onPressed: () {
                appProvider.setBottomNavBarIndex(2);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
