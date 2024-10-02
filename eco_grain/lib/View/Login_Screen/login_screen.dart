import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/Login_Screen/Widgets/login_button.dart';
import 'package:grain_dispenser/View/Login_Screen/Widgets/login_heading.dart';
import 'package:grain_dispenser/View/Login_Screen/Widgets/kogin_username_textfield.dart';
import 'package:grain_dispenser/View/Login_Screen/Widgets/password_textfield.dart';
import 'package:grain_dispenser/View/Login_Screen/Widgets/signup_row.dart';
import 'package:grain_dispenser/View/UI_Helper/Widgets/screen_padding.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_width.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          SizedBox(
            height: screenHeight(context: context, responsive: 0.34),
            child: Image.asset(
              'assets/logo/app logo.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: ScreenPadding.screenPadding(context: context),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeading(),
                SizedBox(
                  height: screenHeight(context: context, responsive: 0.012),
                ),
                Text(
                  "Access and Sustain Your Eco Grain Journey",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: screenHeight(context: context, responsive: 0.04),
                ),
                const LoginUserTextfield(),
                SizedBox(
                  height: screenHeight(context: context, responsive: 0.022),
                ),
                const PasswordTextfield(),
                SizedBox(
                  height: screenHeight(context: context, responsive: 0.035),
                ),
                const LoginButton(),
                SizedBox(
                  height: screenHeight(context: context, responsive: 0.035),
                ),
                const SignupRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
