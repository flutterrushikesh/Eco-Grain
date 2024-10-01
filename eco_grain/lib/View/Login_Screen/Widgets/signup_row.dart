import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/SignUp_Screen/sign_up_screen.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';

class SignupRow extends StatelessWidget {
  const SignupRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New Here ? ",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: screenWidth(
                  context: context,
                  responsive: 0.036,
                ),
              ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: Text(
            "Sign Up Now!",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: screenWidth(
                    context: context,
                    responsive: 0.036,
                  ),
                  color: const Color.fromRGBO(92, 69, 209, 1),
                ),
          ),
        )
      ],
    );
  }
}
