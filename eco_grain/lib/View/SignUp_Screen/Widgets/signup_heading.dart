import 'package:flutter/material.dart';

import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';

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
