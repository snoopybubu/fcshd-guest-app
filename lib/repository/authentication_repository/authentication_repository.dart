import 'dart:async';

import 'package:fcshd_guest/repository/authentication_repository/exceptions/log_in_failure.dart';
import 'package:fcshd_guest/screen/home.dart';
import 'package:fcshd_guest/screen/login.dart';
import 'package:fcshd_guest/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => LogInScreen())
        : Get.offAll(() => const navbar());
  }

  getUser(User? user) {
    final currentUser = user != null ? user.email : null;
    return currentUser;
  }


  Future<String?> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logOut() async => {
        _auth.signOut(),
      };
}
