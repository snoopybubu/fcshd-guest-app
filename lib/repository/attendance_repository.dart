import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class AttendanceRepository extends GetxController {
  static AttendanceRepository get instance => Get.find();

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  final String databaseRoot = "1B7VXNT3TVYEf4jDkfnWtx2Wam2G-j9rCjt8Hyf-6fWk";

  Future<String?> attendanceStatus(String? userID) async {
    try {
      if (userID != null) {
        // Fetch data for the current user using the user's UID
        DataSnapshot snapshot = await _database
            .child('${databaseRoot}/Attendees/${userID}/Status')
            .get();

        String? values = snapshot.value.toString();
        return values;
      }
    } catch (error) {
      print(error);
      return error.toString();
    }
  }

  Future<String?> attendeeFullname(String? userID) async {
    try {
      if (userID != null) {
        // Fetch data for the current user using the user's UID
        DataSnapshot snapshot = await _database
            .child('${databaseRoot}/Attendees/${userID}/Name')
            .get();

        String? values = snapshot.value.toString();
        return values;
      }
    } catch (error) {
      print(error);
      return error.toString();
    }
  }
}
