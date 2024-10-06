import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grain_dispenser/View/Home_Screen/home_screen.dart';

class FirebaseLoginAuth extends ChangeNotifier {
  bool loginSucess = false;

  ///
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  ///
  final GlobalKey<FormState> loginUserKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginPasswordKey = GlobalKey<FormState>();

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
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void checkLoginSuccess(bool loginSucess) {
    this.loginSucess = loginSucess;
    notifyListeners();
  }

  Future<void> logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await Future.delayed(const Duration(seconds: 1));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      log(e.code);
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } finally {
      loginSucess = false;
      notifyListeners();
    }
  }
}
