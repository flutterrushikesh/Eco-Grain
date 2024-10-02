import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grain_dispenser/Controller/Firebase_Auth/Login_Controller/login_controller.dart';
import 'package:grain_dispenser/Controller/Firebase_Auth/Signup_Controller/signup_controller.dart';
import 'package:grain_dispenser/View/Splash_Screen/splash_screen.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(235, 230, 224, 1),
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color.fromRGBO(76, 119, 102, 1),
              ),
            ),
          ),
          textTheme: TextTheme(
            headlineLarge: GoogleFonts.manrope(
              fontSize: screenWidth(
                context: context,
                responsive: 0.051,
              ),
              fontWeight: FontWeight.w600,
            ),
            bodySmall: GoogleFonts.manrope(
              fontSize: screenWidth(context: context, responsive: 0.031),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
