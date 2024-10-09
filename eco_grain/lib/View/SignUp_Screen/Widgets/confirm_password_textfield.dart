import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Signup_Screen_Controller.dart/signup_auth_controller.dart';

import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordTextfield extends StatelessWidget {
  const ConfirmPasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<FirebaseSignupAuth>(context).confirmPasswordFormKey,
      child: TextFormField(
        controller:
            Provider.of<FirebaseSignupAuth>(context).confirmPasswordController,
        obscureText:
            Provider.of<FirebaseSignupAuth>(context).isShowConfirmedPassword,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: screenWidth(context: context, responsive: 0.036)),
        decoration: InputDecoration(
          // hintText: "Mobile Number",
          label: Text(
            "Confirm Password",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: GestureDetector(
            onTap:
                Provider.of<FirebaseSignupAuth>(context).showConfirmedPassword,
            child:
                Provider.of<FirebaseSignupAuth>(context).isShowConfirmedPassword
                    ? Consumer(
                        builder: (context, provider, child) => const Icon(
                          Icons.visibility_off,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      )
                    : Consumer(
                        builder: (context, provider, child) => const Icon(
                          Icons.visibility,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
          ),
        ),
        validator: (confirmPassword) =>
            Provider.of<FirebaseSignupAuth>(context, listen: false)
                .validateConfirmPassword(confirmPassword: confirmPassword!),
      ),
    );
  }
}
