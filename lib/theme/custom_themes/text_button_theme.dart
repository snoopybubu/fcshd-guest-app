import 'package:fcshd_guest/constants/colors.dart';
import 'package:flutter/material.dart';

class GuestAppTextButtonTheme {
  GuestAppTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style:TextButton.styleFrom(
      foregroundColor: Colors.white,
      
      // backgroundColor: GuestAppColors.primaryColor,
      // disabledForegroundColor: Colors.grey,
      // disabledBackgroundColor: Colors.grey[350],
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical:16),
      textStyle: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
      // textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
    )
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style:TextButton.styleFrom(
      foregroundColor: Colors.white,
      // backgroundColor: GuestAppColors.primaryColor,
      // disabledForegroundColor: Colors.grey,
      // disabledBackgroundColor: Colors.grey[350],
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical:16),
      textStyle: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
      // textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500)
    )
  );
}
