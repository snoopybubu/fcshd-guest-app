import 'package:fcshd_guest/app.dart';
import 'package:fcshd_guest/firebase_options.dart';
import 'package:fcshd_guest/repository/attendance_repository.dart';
import 'package:fcshd_guest/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fcshd_guest/screen/login.dart';
import 'package:fcshd_guest/style/apptheme.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) async {
  //       // Initialize Firebase Messaging
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String? fcmToken = await messaging.getToken();
  // print('FCM Token: $fcmToken');
    Get.put(AuthenticationRepository());
    Get.put(AttendanceRepository());
  });
  runApp(const App());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'ICCSHD Guest',
//       theme: AppTheme.defaultTheme,
//       home: LogInScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
