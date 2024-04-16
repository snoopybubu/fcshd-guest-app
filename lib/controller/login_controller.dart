import 'package:fcshd_guest/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../repository/authentication_repository/authentication_repository.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;

  Future<void> login(BuildContext context) async {
    try {
      Loader.show(context,
          progressIndicator:
              const CircularProgressIndicator(backgroundColor: Colors.amber),
          overlayColor: Colors.white60);
      String? error = await AuthenticationRepository.instance
          .logInWithEmailAndPassword(email.text.trim(), password.text.trim());
      if (error != null) {
        AdminAppSnackbar.warningSnackBar(title: "Log In Error", message: error);
      }
    } finally {
      Loader.hide();
    }
  }

  // Future <void> checkLogInStatus () async {
  //   bool? isAuthenticated = await AuthenticationRepository.instance.checkUserStatus();
  // }
}
