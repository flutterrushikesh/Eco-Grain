import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Firebase_Auth/Signup_Controller/signup_controller.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_width.dart';
import 'package:provider/provider.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Accessing the Signup provider once and storing it in a variable
        final signupProvider =
            Provider.of<SignupController>(context, listen: false);

        // Validate all fields at once
        bool isUserNameValid =
            signupProvider.userNameFormKey.currentState?.validate() ?? false;
        bool isPhoneNumberValid =
            signupProvider.emailFomKey.currentState?.validate() ?? false;
        bool isPasswordValid =
            signupProvider.passwordFormKey.currentState?.validate() ?? false;
        bool isConfirmPasswordValid =
            signupProvider.confirmPasswordFormKey.currentState?.validate() ??
                false;

        // Check if all fields are valid
        if (isUserNameValid &&
            isPhoneNumberValid &&
            isPasswordValid &&
            isConfirmPasswordValid) {
          signupProvider.createNewUser(
            email: signupProvider.emailController.text,
            password: signupProvider.confirmPasswordController.text,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Sign Up success"),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please provide proper details")),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor:
            Theme.of(context).elevatedButtonTheme.style?.backgroundColor,
        minimumSize: WidgetStatePropertyAll(
          Size(
            double.infinity,
            screenHeight(context: context, responsive: 0.055),
          ),
        ),
      ),
      child: Text(
        "Sign Up",
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
      ),
    );
  }
}
