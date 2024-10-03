import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/Home_Screen/home_screen.dart';

class SignupController extends ChangeNotifier {
  final FirebaseAuth firebaseaAuth = FirebaseAuth.instance;

  ///TEXTEDITING CONTROLLERS FOR STORES THE USER ENTERED INPUT.
  ///TO VALIDATE & PERFORM ANY OPERATION.
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ///GLOBAL KEYS FOR VALIDATE TEXTFIELD.
  final GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFomKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmPasswordFormKey = GlobalKey<FormState>();

  bool isShowNewPassword = true;
  bool isShowConfirmedPassword = true;

  ///VALIDATION USERNAME WITH AS PER MY REQUIREMENT.
  String? validateUsername({required String username}) {
    if (username.isEmpty) {
      return 'Username is required';
    } else if (username.length < 6 || username.length > 20) {
      return 'Username must be between 6 and 20 characters';
    } else if (username.contains(' ')) {
      return 'Username should not contain spaces';
    }
    return null;
  }

  ///VERIFY USERNAME TEXTFIELD USING GLOBLE KEYS
  void verifyUserName({required BuildContext context}) {
    if (userNameFormKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }
  }

  ///VALIDATION PHONENUMBER WITH AS PER MY REQUIREMENT.

  String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'Please enter an email';
    }
    // Check if the email contains any spaces
    if (email.contains(' ')) {
      return 'Email should not contain spaces';
    }

    // You can optionally add other email validations if needed
    return null;
  }

  ///VALIDATION PASSWORD WITH AS PER MY REQUIREMENT.
  String? validatePassword({required String password}) {
    // Regex pattern for at least 1 special character and 1 digit
    final RegExp passwordPattern =
        RegExp(r'^(?=.*[0-9])(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{6,20}$');

    if (password.isEmpty) {
      return 'Password is required';
    } else if (!passwordPattern.hasMatch(password)) {
      return 'Password must be 6-20 characters, include 1 digit and 1 special character';
    }
    return null;
  }

  ///VALIDATION PASSWORD WITH AS PER MY REQUIREMENT.
  String? validateConfirmPassword({required String confirmPassword}) {
    if (confirmPassword.isEmpty) {
      return 'Please confirm your password';
    } else if (confirmPassword != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void showNewPassword() {
    isShowNewPassword = !isShowNewPassword;
    notifyListeners();
  }

  void showConfirmedPassword() {
    isShowConfirmedPassword = !isShowConfirmedPassword;
    notifyListeners();
  }

  void createNewUser({required String email, required String password}) async {
    // log(email);
    // log(password);
    UserCredential val = await firebaseaAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    log("${val.user}");
  }
}
