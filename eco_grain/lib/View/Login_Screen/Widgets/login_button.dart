import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/Home_Screen/home_screen.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_width.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
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
