import 'package:flutter/material.dart';

class SignUpDescription extends StatelessWidget {
  const SignUpDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Start Your Eco Grain Journey and discover sustainable, high-quality grains for a healthier planet!",
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}
