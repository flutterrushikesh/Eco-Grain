import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Firebase_Auth/Signup_Controller/signup_controller.dart';

import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordTextfield extends StatelessWidget {
  const ConfirmPasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<SignupController>(context).confirmPasswordFormKey,
      child: TextFormField(
        controller:
            Provider.of<SignupController>(context).confirmPasswordController,
        obscureText:
            Provider.of<SignupController>(context).isShowConfirmedPassword,
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
            onTap: Provider.of<SignupController>(context).showConfirmedPassword,
            child:
                Provider.of<SignupController>(context).isShowConfirmedPassword
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
            Provider.of<SignupController>(context, listen: false)
                .validateConfirmPassword(confirmPassword: confirmPassword!),
      ),
    );
  }
}
