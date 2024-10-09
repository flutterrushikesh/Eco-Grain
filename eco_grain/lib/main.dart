import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:grain_dispenser/Controller/Bottom_Nav_Controller/list_of_nav_icon_controller.dart';
import 'package:grain_dispenser/Controller/Bottom_Nav_Controller/list_of_screen_controller.dart';
import 'package:grain_dispenser/Controller/Login_Screen_Controller/login_auth_controller.dart';
import 'package:grain_dispenser/Controller/Profile_Screen_Controller/profile_image_controller.dart';
import 'package:grain_dispenser/Controller/Signup_Screen_Controller.dart/signup_auth_controller.dart';

import 'package:grain_dispenser/View/Splash_Screen/splash_screen.dart';

import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';
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
        ChangeNotifierProvider(create: (context) => FirebaseSignupAuth()),
        ChangeNotifierProvider(create: (context) => FirebaseLoginAuth()),
        Provider(create: (context) => ListoFScreen()),
        Provider(create: (context) => ListOfNavIcon()),
        ChangeNotifierProvider(create: (context) => ProfileImageController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          secondaryHeaderColor: const Color.fromRGBO(76, 119, 102, 1),
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
              fontSize: screenWidth(
                context: context,
                responsive: 0.031,
              ),
            ),
            bodyMedium: GoogleFonts.manrope(
              fontSize: screenWidth(
                context: context,
                responsive: 0.04,
              ),
              color: const Color.fromRGBO(76, 119, 102, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
