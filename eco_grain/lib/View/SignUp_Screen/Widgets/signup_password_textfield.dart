import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Firebase_Auth/Signup_Controller/signup_controller.dart';
import 'package:grain_dispenser/View/ui_helper/responsive_screen_height.dart';
import 'package:provider/provider.dart';

class SignupPasswordTextfield extends StatelessWidget {
  const SignupPasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<SignupController>(context).passwordFormKey,
      child: TextFormField(
        controller: Provider.of<SignupController>(context).passwordController,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: screenWidth(context: context, responsive: 0.036)),
        decoration: InputDecoration(
          label: Text(
            "Password",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: const Icon(
            Icons.visibility_off,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        validator: (password) =>
            Provider.of<SignupController>(context, listen: false)
                .validatePassword(password: password!),
      ),
    );
  }
}
