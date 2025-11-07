import 'dart:async';
import 'package:flutter/material.dart';
import 'sginin.dart';

class onbording extends StatefulWidget {
  const onbording({super.key});

  @override
  State<onbording> createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
  // النصوص (عناوين + أوصاف)
  final List<Map<String, String>> _pages = [
    {
      "title": "Welcome aboard!",
      "desc":
          "Discover a thousands of courses and rich new milestones every day",
      "image": "assets/images/Welcome_aboard.png",
    },
    {
      "title": "Learn.Grow.Repeat!",
      "desc": "Access your courses on mobile, tablet, or desktop easily",
      "image": "assets/images/Learn._Grow._Repeat..png",
    },
    {
      "title": "Start Learning Today",
      "desc": "Stay motivated by monitoring your learning journey daily",
      "image": "assets/images/Start_Learning_Today.png",
    },
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // مؤقت لتغيير النصوص كل 3 ثواني
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _pages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // لون الخلفية
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ---- الصورة ----
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset(
                _pages[_currentIndex]["image"]!,
                width: 350,
                height: 350,
              ),
            ),

            // ---- النصوص مع AnimatedSwitcher ----
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                final slide = Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(animation);
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(position: slide, child: child),
                );
              },
              child: Column(
                key: ValueKey<int>(_currentIndex), // مفتاح ليتعرف على التغيير
                children: [
                  const SizedBox(height: 20),
                  Text(
                    _pages[_currentIndex]["title"]!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      _pages[_currentIndex]["desc"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ---- المؤشر + الزر ----
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  // مؤشر النقاط
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (i) => _buildDot(isActive: i == _currentIndex),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // زر Get Started
                  // زر Get Started
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        iconColor: Color(0xffffffff),
                        backgroundColor: const Color(0xFFE53935), // أحمر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Signin()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Get Started",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_forward, size: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت للنقطة
  Widget _buildDot({bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE53935) : Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
