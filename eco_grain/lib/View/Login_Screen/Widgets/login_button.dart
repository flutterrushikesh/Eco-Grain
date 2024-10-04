import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Login_Screen_Controller/login_auth_controller.dart';

import 'package:grain_dispenser/View/Home_Screen/home_screen.dart';

import 'package:grain_dispenser/View/UI_Helper/responsive_screen_width.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final FirebaseLoginAuth loginController =
            Provider.of<FirebaseLoginAuth>(
          context,
          listen: false,
        );

        bool isUserNameValid =
            loginController.loginUserKey.currentState?.validate() ?? false;
        bool isPasswordValid =
            loginController.loginPasswordKey.currentState?.validate() ?? false;

        if (isUserNameValid && isPasswordValid) {
          loginController.checkLoginSuccess(true);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Success"),
            ),
          );
        }
      },
      style: ButtonStyle(
        backgroundColor:
            Theme.of(context).elevatedButtonTheme.style!.backgroundColor,
        minimumSize: WidgetStatePropertyAll(
          Size(
            double.infinity,
            screenHeight(context: context, responsive: 0.055),
          ),
        ),
      ),
      child: Text(
        "Login",
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
      ),
    );
  }
}
