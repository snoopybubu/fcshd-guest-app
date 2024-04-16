import 'package:fcshd_guest/constants/colors.dart';
import 'package:flutter/material.dart';

class GuestAppElevatedButtonTheme {
  GuestAppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: Colors.white,
      backgroundColor: GuestAppColors.primaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey[350],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical:16),
      textStyle: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
      // textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: Colors.white,
      backgroundColor: GuestAppColors.primaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey[350],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical:16),
      textStyle: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
      // textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
    )
  );
}
