import 'package:flutter/material.dart';
import 'package:neu_byte_digital/route/route_constants.dart';
import 'package:neu_byte_digital/screens/outboard/intro_screen.dart';
import 'package:neu_byte_digital/screens/registration/views/login_screen.dart';
import 'package:neu_byte_digital/screens/registration/views/signup_screen.dart';
import 'screen_export.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

    case introScreenRoute :
      return MaterialPageRoute(
        builder: (context) => const IntroScreen(),
      );

    case loginScreenRoute :
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

    case signupScreenRoute :
      return MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );




    default:
      return MaterialPageRoute(
        // Make a screen for undefine
        builder: (context) => const Scaffold(body : Text("No Route found")),
      );
  }
}
