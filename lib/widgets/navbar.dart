import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/screen/home.dart';
import 'package:fcshd_guest/screen/notification.dart';
import 'package:fcshd_guest/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class navbar extends StatelessWidget {
  const navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            animationDuration: const Duration(seconds: 1),
            // backgroundColor: GuestAppColors.surfaceColor,

            selectedIndex: controller.selectedMenu.value,
            onDestinationSelected: (index) {
              controller.selectedMenu.value = index;
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Iconsax.user),
                label: "My QR",
              ),
              NavigationDestination(
                icon: Icon(Iconsax.notification_status),
                label: "Notification",
              ),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class NavBarController extends GetxController {
  final Rx<int> selectedMenu = 0.obs;

  final screens = [
    const HomeScreen(),
    const ProfileScreen(),
    notificationListScreen(),
    Container(color: Colors.amber)
  ];
}
