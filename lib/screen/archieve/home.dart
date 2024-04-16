import 'package:fcshd_guest/constants/text.dart';
import 'package:fcshd_guest/repository/authentication_repository/authentication_repository.dart';
import 'package:fcshd_guest/widgets/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow[100]!, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    child: Icon(LineAwesomeIcons.alternate_sign_out),
                    alignment: Alignment.centerRight,
                  ),
                  onTap: () async {
                    await AuthenticationRepository.instance.logOut();
                  },
                ),
                const Text(
                  "Hello There",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.black87),
                ),
                const Text("Welcome to the ICCSHD 2024!"),
                const SizedBox(height: 30),
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                          child: MenuOption(
                              url: GuestAppText.newsLink,
                              icons: LineAwesomeIcons.newspaper_1,
                              title: "News Feed")),
                      const SizedBox(
                        width: 5,
                      ),

                      Expanded(
                          child: MenuOption(
                              url: GuestAppText.scheduleLink,
                              icons: LineAwesomeIcons.calendar_with_day_focus,
                              title: "Schedule")),
                      const SizedBox(
                        width: 5,
                      ),

                      Expanded(
                          child: MenuOption(
                              url: GuestAppText.programmeLink,
                              icons: LineAwesomeIcons.book,
                              title: "Abstract Proceeding")),
                      
                      
                    ],
                  ),
                ),
                
                const SizedBox(height: 15),
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                          child: MenuOption(
                              url: GuestAppText.venueLink,
                              icons: LineAwesomeIcons.alternate_map_marked,
                              title: "Floor Map")),
                      const SizedBox(
                        width: 5,
                      ),
                     
                    ],
                  ),
                ),
                const SizedBox(height: 15),
   
              ],
            ),
          )),
        ),
      ),
    );
  }
}
