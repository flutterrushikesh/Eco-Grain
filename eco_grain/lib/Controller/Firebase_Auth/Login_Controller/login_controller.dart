import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final GlobalKey<FormState> loginUserKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginPasswordKey = GlobalKey<FormState>();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ///
  bool isShowPassword = true;

  String? validateLoginUserName({required String loginUsername}) {
    if (loginUsername.isEmpty) {
      return "Please enter username";
    }
    return null;
  }

  String? validateLoginPassword({required String loginPassword}) {
    if (loginPassword.isEmpty) {
      return "Please enter password";
    }
    return null;
  }

  void showPassword() {
    log("$isShowPassword");
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
