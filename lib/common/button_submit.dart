// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/theme.dart';

ButtonStyle buttonSubmit = ButtonStyle(
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(appTheme.primaryColor),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);

ButtonStyle buttonCancel = ButtonStyle(
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  )),
  foregroundColor: MaterialStateProperty.all(Colors.white),
  backgroundColor: MaterialStateProperty.all(buttonColorRegular),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      color: Colors.white,
    ),
  ),
);
