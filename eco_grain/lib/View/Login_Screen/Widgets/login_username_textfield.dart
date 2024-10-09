import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Login_Screen_Controller/login_auth_controller.dart';
import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';

import 'package:provider/provider.dart';

class LoginUserTextfield extends StatelessWidget {
  const LoginUserTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<FirebaseLoginAuth>(context).loginUserKey,
      child: TextFormField(
        controller: Provider.of<FirebaseLoginAuth>(context).emailController,
        keyboardType: TextInputType.emailAddress,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: screenWidth(context: context, responsive: 0.036)),
        decoration: InputDecoration(
          // hintText: "Mobile Number",
          label: Text(
            "Email",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        validator: (loginUsername) =>
            Provider.of<FirebaseLoginAuth>(context, listen: false)
                .validateLoginUserName(loginUsername: loginUsername!),
      ),
    );
  }
}
