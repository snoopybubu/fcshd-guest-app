import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/theme/custom_themes/appbar_theme.dart';
import 'package:fcshd_guest/theme/custom_themes/elevated_button_theme.dart';
import 'package:fcshd_guest/theme/custom_themes/navigation_bar_theme.dart';
import 'package:fcshd_guest/theme/custom_themes/text_button_theme.dart';
import 'package:fcshd_guest/theme/custom_themes/text_theme.dart';
import 'package:fcshd_guest/theme/custom_themes/textfield_theme.dart';
import 'package:flutter/material.dart';

class GuestAppTheme {
  GuestAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: GuestAppColors.primaryColor,
      scaffoldBackgroundColor: const Color.fromARGB(255, 248, 246, 236),
      textTheme: GuestAppTextTheme.lightTextTheme,
      elevatedButtonTheme: GuestAppElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: GuestAppBarTheme.lightAppBarTheme,
      inputDecorationTheme: GuestAppTextFieldTheme.lightInputDecorationTheme,
      textButtonTheme: GuestAppTextButtonTheme.lightTextButtonTheme,
      navigationBarTheme: GuestAppNavBarTheme.lightNavBarTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: GuestAppColors.primaryColor,
      scaffoldBackgroundColor: const Color.fromARGB(255, 52, 52, 52),
      textTheme: GuestAppTextTheme.darkTextTheme,
      elevatedButtonTheme: GuestAppElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: GuestAppBarTheme.darkAppBarTheme,
      inputDecorationTheme: GuestAppTextFieldTheme.darkInputDecorationTheme,
      textButtonTheme: GuestAppTextButtonTheme.darkTextButtonTheme,
      navigationBarTheme: GuestAppNavBarTheme.darkNavBarTheme);
}
