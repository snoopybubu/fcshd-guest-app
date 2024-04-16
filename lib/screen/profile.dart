import 'dart:convert';
import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/constants/images.dart';
import 'package:fcshd_guest/constants/sizes.dart';
import 'package:fcshd_guest/device/device_helper.dart';
import 'package:fcshd_guest/device/save_file_mobile.dart';
import 'package:fcshd_guest/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../widgets/box.dart';
import '../widgets/certBox.dart';
import '../constants/text.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../repository/attendance_repository.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

//Local imports
// import 'save_file_mobile.dart' if (dart.library.html) 'save_file_web.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = GuestAppHelper.isDarkMode(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(child: Obx(() {
        User? user = AuthenticationRepository.instance.firebaseUser.value;
        String currentUser = AuthenticationRepository.instance.getUser(user);
        String userID = base64Encode(utf8.encode(currentUser));
        AttendanceRepository attendanceRepository =
            AttendanceRepository.instance;
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: GuestAppSizes.paddingVertical,
              horizontal: GuestAppSizes.paddingHorizontal),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: GuestAppSizes.defaultSpace),
            boxWidget(
                icon: Iconsax.scan_barcode,
                darkMode: darkMode,
                text: GuestAppText.qrDesc),
            const SizedBox(height: GuestAppSizes.defaultSpace),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: GuestAppSizes.paddingQRVertical,
                    horizontal: GuestAppSizes.paddingQRHorizontal),
                child: Center(
                  child: PrettyQr(
                    data: currentUser,
                    size: 200,
                    elementColor: GuestAppColors.primaryColor,
                    roundEdges: true,
                    typeNumber: 2,
                    errorCorrectLevel: QrErrorCorrectLevel.L,
                  ),
                )),
            const SizedBox(height: GuestAppSizes.defaultSpace),
            Text(currentUser, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: GuestAppSizes.spaceBtwLargerSections),
            //===============================================
            //For debugging purpose only, please delete later
            //===============================================
            // Text(userID),

            FutureBuilder(
              future: Future.wait([
                attendanceRepository.attendanceStatus(userID),
                attendanceRepository.attendeeFullname(userID),
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data available.');
                } else {
                  String? attendanceStatus = snapshot.data![0] as String?;
                  String? attendeeFullname = snapshot.data![1] as String?;
                  Map<String, String> statusMap =
                      parseStatusString(attendanceStatus!);
                  bool allCheckedIn = statusMap.values.every(
                      (value) => value.toLowerCase().trim() == 'checked in');
                  List<Widget> containers = statusMap.entries.map((entry) {
                    return AttendanceBox(
                      attendanceDay: entry.key,
                      icon: LineAwesomeIcons.check_circle,
                      status: entry.value,
                    );
                  }).toList();
                  return Container(
                    decoration: BoxDecoration(
                        color: darkMode
                            ? GuestAppColors.widgetPrimaryDark
                            : GuestAppColors.widgetPrimaryLight,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(
                                1, 1), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: GuestAppSizes.paddingVertical,
                          horizontal: GuestAppSizes.paddingHorizontal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            GuestAppText.attendanceTitle,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: GuestAppSizes.spaceBtwTexts),
                          Text(
                            GuestAppText.attendanceDesc,
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: GuestAppSizes.spaceBtwItems),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: containers),
                          const SizedBox(height: GuestAppSizes.spaceBtwItems),
                          certificationBox(
                            darkMode: darkMode,
                              userCompleted: allCheckedIn,
                              fullname: attendeeFullname!),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ]),
        ));
      })),
    );
  }

  Map<String, String> parseStatusString(String statusString) {
    // Assuming the status string is in the format: "{key1:value1, key2:value2, ...}"
    // You may need to adjust this based on the actual format of your status string
    statusString = statusString.substring(
        1, statusString.length - 1); // Remove the curly braces
    List<String> keyValuePairs = statusString.split(', ');
    Map<String, String> statusMap = {};
    for (String pair in keyValuePairs) {
      List<String> parts = pair.split(':');
      statusMap[parts[0]] = parts[1];
    }
    return statusMap;
  }
}
