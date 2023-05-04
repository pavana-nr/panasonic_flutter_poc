import 'package:flutter/material.dart';
import 'package:newdemoproject/mixins/mixins.dart';

abstract class ThemeText with ColorApp {
  static const TextStyle commonHeader = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600);

  static const TextStyle blackText = TextStyle(
      fontFamily: 'Montserrat',
      color: ColorApp.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.normal);

  static const TextStyle subHeading = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600);
  static const TextStyle blueHeading = TextStyle(
      fontFamily: 'Montserrat',
      color: ColorApp.blueColor,
      fontSize: 20,
      fontWeight: FontWeight.w600);
  static const TextStyle stainName = TextStyle(
      fontFamily: 'Montserrat',
      color: ColorApp.blueColor,
      fontSize: 16,
      fontWeight: FontWeight.normal);
}
