import 'package:flutter/material.dart';
import 'package:shadow/Global/Settings/colors.dart';
import 'fonts.dart';

String gilroyFontFamily = "Gilroy";

ThemeData theme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: AppColors.primaryColor, onSurface: AppColors.surfaceColor)),
    appBarTheme: const AppBarTheme(foregroundColor: Colors.black),
    primarySwatch: AppColors.swatch,
    accentColor: AppColors.swatch,
    fontFamily: gilroyFontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: defaultTextTheme);
