// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
// import '../repository/attendance_repository.dart';

// class AttendanceController extends GetxController {
//   static AttendanceController get instance => Get.find();

//   final String userID = '';

//   Future <String> getStatus(BuildContext context) async{
//     try{
//       Loader.show(context,
//       progressIndicator:const CircularProgressIndicator(backgroundColor: Colors.amber,color: Colors.white,) , overlayColor: Colors.white60);
//       String? error = await AttendanceRepository.instance.fetchDataForCurrentUser(userID);
//     }
//   }
// }
