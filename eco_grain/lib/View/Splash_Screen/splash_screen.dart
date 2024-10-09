import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:grain_dispenser/View/Bottom_Navigation.dart/bottom_navigation.dart';

import 'package:grain_dispenser/View/Login_Screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const BottomNavbar();
                }
                return const LoginScreen();
              }),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/plash screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
