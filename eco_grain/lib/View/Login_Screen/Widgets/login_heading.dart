import 'package:flutter/material.dart';

class LoginHeading extends StatelessWidget {
  const LoginHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Join Your Eco Grain Journey",
        style: Theme.of(context).textTheme.headlineLarge);
  }
}
