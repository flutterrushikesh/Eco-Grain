import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(fontSize: screenWidth(context: context, responsive: 0.036)),
      decoration: InputDecoration(
        // hintText: "Mobile Number",
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
    );
  }
}
