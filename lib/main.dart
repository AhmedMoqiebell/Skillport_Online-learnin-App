import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_flutter_project/pages/chats/chats_page.dart';
import 'package:our_flutter_project/pages/registration/onbording.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'pages/cources/courses_page.dart';
import 'pages/chats/profile.dart';
import 'pages/home/homepage.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(username: ''),
    CoursesPage(),
    ChatsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: AppColors.backgroundLight,
          selectedItemColor: AppColors.primaryLight,
          unselectedItemColor: AppColors.secondaryLight,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icons/home-2.svg',
                width: 24,
                height: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icons/play.svg',
                width: 24,
                height: 24,
              ),
              label: 'Courses',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icons/message-text.svg',
                width: 24,
                height: 24,
              ),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icons/frame.svg',
                width: 24,
                height: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

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
        MaterialPageRoute(
          builder: (_) => const onbording(),
        ), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEFEF), // نفس لون الخلفية بالصورة
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة اللوجو
            Image.asset(
              "assets/images/logo.png", // ضع صورة اللوجو هنا
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
