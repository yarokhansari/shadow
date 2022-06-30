import 'package:flutter/material.dart';

var introc = Colors.black;
var introc1 = Colors.white;

Map<int, Color> colorCodes = const {
  50: Color(0xffeef7f1),
  100: Color(0xffddefe3),
  200: Color(0xffcbe8d6),
  300: Color(0xffbae0c8),
  400: Color(0xffa9d8ba),
  500: Color(0xff98d0ac),
  600: Color(0xff87c89e),
  700: Color(0xff75c191),
  800: Color(0xff64b983),
  900: Color(0xff53b175),
};

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();
  static MaterialColor swatch = MaterialColor(0xff53B175, colorCodes);
  static const primaryColor = Color(0xff53B175);
  static const surfaceColor = Colors.white;
  static const primaryLight = Color.fromARGB(251, 9, 219, 86);
  static const darkGrey = Color(0xff7C7C7C);
  static const subCatColors = [
    Color(0xffF8A44C),
    AppColors.primaryColor,
    Color.fromARGB(255, 72, 204, 236),
    Color.fromARGB(255, 185, 76, 248),
    Color.fromARGB(255, 248, 76, 133),
  ];
}
