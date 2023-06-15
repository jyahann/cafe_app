import 'package:cafe_app/app_config/colors.dart';
import 'package:flutter/cupertino.dart';

const CupertinoThemeData appTheme = CupertinoThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: backgroundColor,
  barBackgroundColor: backgroundColor,
  primaryColor: primaryColor,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      color: CupertinoColors.black,
      fontFamily: "SFProDisplay",
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    navLargeTitleTextStyle: TextStyle(
      color: CupertinoColors.black,
      fontFamily: "SFProDisplay",
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ),
);
