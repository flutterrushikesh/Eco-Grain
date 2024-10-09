import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Signup_Screen_Controller.dart/signup_auth_controller.dart';

import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';
import 'package:provider/provider.dart';

class SignupMobleTextfield extends StatelessWidget {
  const SignupMobleTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<FirebaseSignupAuth>(context, listen: false).emailFomKey,
      child: TextFormField(
        controller: Provider.of<FirebaseSignupAuth>(context).emailController,
        keyboardType: TextInputType.emailAddress,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: screenWidth(context: context, responsive: 0.036)),
        decoration: InputDecoration(
          // hintText: "Mobile Number",
          label: Text(
            "Email Address",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        validator: (email) =>
            Provider.of<FirebaseSignupAuth>(context, listen: false)
                .validateEmail(email: email!),
      ),
    );
  }
}
