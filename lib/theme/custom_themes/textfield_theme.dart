import 'package:fcshd_guest/constants/colors.dart';
import 'package:flutter/material.dart';

class GuestAppTextFieldTheme {
  GuestAppTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: GuestAppColors.fontLight),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: GuestAppColors.fontLight),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.primaryColor)
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.primaryColor)
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.secondaryColor)
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.error)
    ),
    
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.secondaryColor)
    ),

  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: GuestAppColors.grey,
    suffixIconColor: GuestAppColors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: GuestAppColors.fontDark),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: GuestAppColors.fontDark),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.grey)
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.grey)
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.secondaryColor)
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.error)
    ),
    
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: GuestAppColors.secondaryColor)
    ),

  );
}
