// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/theme.dart';
import 'package:sells_app/screens/products/index.dart';

TextButton backButton(BuildContext context) => TextButton(
      child: Container(
        width: 30,
        height: 30,
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: appTheme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsList(),
          ),
          (route) => false,
        );
      },
    );
