import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Firebase_Auth/Signup_Controller/signup_controller.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';
import 'package:provider/provider.dart';

class SignupMobleTextfield extends StatelessWidget {
  const SignupMobleTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<SignupController>(context, listen: false)
          .phoneNumberFormKey,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: screenWidth(context: context, responsive: 0.036)),
        decoration: InputDecoration(
          // hintText: "Mobile Number",
          label: Text(
            "Mobile Number",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        validator: (phoneNumber) =>
            Provider.of<SignupController>(context, listen: false)
                .validateMobileNumber(phoneNumber: phoneNumber!),
      ),
    );
  }
}
