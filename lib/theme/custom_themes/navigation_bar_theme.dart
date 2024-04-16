import 'package:fcshd_guest/constants/colors.dart';
import 'package:flutter/material.dart';

class GuestAppNavBarTheme {
  GuestAppNavBarTheme._();

  static var lightNavBarTheme = NavigationBarThemeData(
    indicatorColor: GuestAppColors.surfaceColor.withOpacity(0.6),
  );

  static var darkNavBarTheme = NavigationBarThemeData(
    indicatorColor: GuestAppColors.secondaryColor.withOpacity(0.6),
  );
}
