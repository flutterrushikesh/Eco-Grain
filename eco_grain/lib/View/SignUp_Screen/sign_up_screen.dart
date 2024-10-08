import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Signup_Screen_Controller.dart/signup_auth_controller.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/confirm_password_textfield.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/sign_up_description.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/signup_button.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/signup_heading.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/signup_moble_textfiel.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/signup_password_textfield.dart';
import 'package:grain_dispenser/View/SignUp_Screen/Widgets/uername_textfield.dart';
import 'package:grain_dispenser/View/UI_Helper/Widgets/screen_padding.dart';
import 'package:grain_dispenser/View/ui_helper/responsive_screen_height.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Consumer<FirebaseSignupAuth>(
        builder: (context, provider, child) => provider.signUpSucess
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SignupHeading(),
                        SizedBox(
                          height:
                              screenHeight(context: context, responsive: 0.012),
                        ),
                        const SignUpDescription(),
                        SizedBox(
                          height:
                              screenHeight(context: context, responsive: 0.04),
                        ),
                        const UsernameTextfield(),
                        SizedBox(
                          height:
                              screenHeight(context: context, responsive: 0.022),
                        ),
                        const SignupMobleTextfield(),
                        SizedBox(
                          height:
                              screenHeight(context: context, responsive: 0.022),
                        ),
                        const SignupPasswordTextfield(),
                        SizedBox(
                          height:
                              screenHeight(context: context, responsive: 0.022),
                        ),
                        const ConfirmPasswordTextfield(),
                        SizedBox(
                          height:
                              screenHeight(context: context, responsive: 0.035),
                        ),
                        const SignupButton(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
