import 'dart:async';
import 'package:flutter/material.dart';
import 'package:our_flutter_project/pages/registration/onbording.dart';
import 'package:our_flutter_project/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // الانتقال بعد 3 ثواني إلى OnboardingPage
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const onbording()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة اللوجو
            Image.asset(
              "assets/images/logosplashscreen.png", 
              width: 140,
              height: 140,
            ),
            const SizedBox(height: 20),
            // النص
            const Text(
              "SkillPort",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

