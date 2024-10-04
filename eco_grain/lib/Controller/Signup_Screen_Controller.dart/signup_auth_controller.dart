import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grain_dispenser/View/Home_Screen/home_screen.dart';

class FirebaseSignupAuth extends ChangeNotifier {
  bool signUpSucess = false;

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

  ///VALIDATION EMAIL WITH AS PER MY REQUIREMENT.

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

  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    log("IN SIGNUP");
    try {
      // Create a new user using Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      signUpSucess = true;
      // Navigate to the Home page after signup
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      });
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      String message = '';
      // Handle different Firebase authentication error cases
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with this email.';
      } else {
        message = 'An unknown error occurred. Please try again.';
      }

      // Show error message using Fluttertoast
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      // Fallback for any other type of exception
      Fluttertoast.showToast(
        msg: "$e",
        // msg: 'An unexpected error occurred. Please try again later.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } finally {
      signUpSucess = false;
      notifyListeners();
    }
  }
}
