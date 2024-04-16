import 'package:fcshd_guest/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class boxWidget extends StatelessWidget {
  final IconData icon;
  bool darkMode;
  final String text;

  boxWidget({required this.icon, required this.darkMode, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: darkMode
            ? GuestAppColors.widgetPrimaryDark
            : GuestAppColors.widgetPrimaryLight,
        // gradient: LinearGradient(
        //     colors: [Colors.white, Colors.grey[50]!],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, color: GuestAppColors.secondaryColor, size: 30),
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.justify,
                maxLines: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AttendanceBox extends StatelessWidget {
  final IconData icon;
  final String attendanceDay;
  final String status;

  const AttendanceBox(
      {required this.icon, required this.attendanceDay, required this.status});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
            decoration: BoxDecoration(
              color: status.trim() == 'Checked In'
                  ? GuestAppColors.surfaceColor
                  : GuestAppColors.lightGrey,
              // gradient: LinearGradient(
              //     colors: [Colors.white, Colors.grey[100]!],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              // border: Border.all(color: Colors.black)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: status.trim() == "Checked In"
                        ? GuestAppColors.primaryColor
                        : GuestAppColors.grey,
                  ),
                  const SizedBox(height: 5),
                  Text(attendanceDay)
                ],
              ),
            )),
      ),
    );
  }
}
