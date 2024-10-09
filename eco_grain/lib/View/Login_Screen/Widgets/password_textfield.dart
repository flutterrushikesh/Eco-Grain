import 'package:flutter/material.dart';
import 'package:grain_dispenser/Controller/Login_Screen_Controller/login_auth_controller.dart';
import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';

import 'package:provider/provider.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<FirebaseLoginAuth>(context).loginPasswordKey,
      child: TextFormField(
        controller:
            Provider.of<FirebaseLoginAuth>(context).loginPasswordController,
        keyboardType: TextInputType.emailAddress,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: screenWidth(context: context, responsive: 0.036),
            ),
        obscureText: Provider.of<FirebaseLoginAuth>(context).isShowPassword,
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
          suffixIcon: GestureDetector(
            onTap: () {
              Provider.of<FirebaseLoginAuth>(context, listen: false)
                  .showPassword();
            },
            child: Provider.of<FirebaseLoginAuth>(context, listen: false)
                    .isShowPassword
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
        validator: (loginPassword) =>
            Provider.of<FirebaseLoginAuth>(context, listen: false)
                .validateLoginPassword(loginPassword: loginPassword!),
      ),
    );
  }
}
