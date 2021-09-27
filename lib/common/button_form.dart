// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';

ButtonStyle buttonForm = ButtonStyle(
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  )),
  backgroundColor: MaterialStateProperty.all(Colors.white),
  foregroundColor: MaterialStateProperty.all(Color(0xff707070)),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontFamily: 'Cairo',
      fontSize: 15,
      color: Colors.white,
    ),
  ),
);
