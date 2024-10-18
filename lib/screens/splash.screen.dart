import 'package:advertisy/screens/login.screen.dart';
import 'package:advertisy/utils/color.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/logo.png"),
      title: const Text(
        "Advertisy",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: ThemeColors.splashScreenTheme,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: const LoginScreen(),
      durationInSeconds: 3,
    );
  }
}
