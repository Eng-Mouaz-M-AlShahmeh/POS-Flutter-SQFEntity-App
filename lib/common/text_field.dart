// Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:sells_app/common/theme.dart';

InputDecoration textInputDecoration = InputDecoration(
  labelStyle: appTheme.textTheme.headline5,
  errorStyle: appTheme.textTheme.headline6,
  hintText: '',
  hintStyle: appTheme.textTheme.headline5,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: appTheme.primaryColor,
      width: 1.0,
    ),
  ),
);

InputDecoration textInputDecorationVAT = InputDecoration(
  labelStyle: tableHeaderSub,
  errorStyle: appTheme.textTheme.headline6,
  hintText: '',
  hintStyle: tableHeaderSub,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: appTheme.primaryColor,
      width: 1.0,
    ),
  ),
);
