
import 'package:fcshd_guest/screen/login.dart';
import 'package:fcshd_guest/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: GuestAppTheme.lightTheme,
      darkTheme: GuestAppTheme.darkTheme,
      home:LogInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}