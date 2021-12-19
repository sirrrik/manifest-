import 'package:flutter/material.dart';

class ManifestAppTheme {
  ManifestAppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color textBG = Color(0xFFBED8CF);
  static const Color strongButton = Color(0xFFED6F00);
  static const Color lightButton = Color(0xFFFCCEBE);
  static const Color widgetBG = Color(0xFFfbe7d3);

  static const Color darkText = Color.fromARGB(255, 11, 32, 41);
  static const Color darkerText = Color.fromARGB(255, 1, 23, 29);
  static const Color lightText = Color.fromARGB(255, 188, 198, 202);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    headline4: mainHeadline,
    headline5: headline,
    bodyText1: maintext,
    subtitle1: subtitle,
    button: btText, //will also work for bottom nav text
  );

  static const TextStyle mainHeadline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle text = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle maintext = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle btText = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 22,
    letterSpacing: 0.2,
    color: lightText, // because of orange bg for buttons
  );
}
