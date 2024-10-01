import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';

class SignupHeading extends StatelessWidget {
  const SignupHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Start Your Eco Grain Journey",
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: screenWidth(context: context, responsive: 0.051),
          ),
    );
  }
}
