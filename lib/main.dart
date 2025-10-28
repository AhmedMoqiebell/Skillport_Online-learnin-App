  
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/cources/courses_page.dart';
import 'pages/chats/chats_page.dart';
import 'pages/chats/profile.dart';
import 'pages/home/homepage.dart';
import 'theme/app_colors.dart'; // ملف الألوان الخاص بك

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // المفتاح للوصول من أي مكان (مثل صفحة البروفايل)
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  ThemeMode _themeMode = ThemeMode.light; // الوضع الافتراضي

  // قائمة الصفحات
  final List<Widget> _pages = [
    const HomePage(username: ''),
    CoursesPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];

  // دالة لتبديل الثيم
  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _themeMode == ThemeMode.dark;

    // تعريف ألوان الناف بار حسب وضع الثيم
    final navBarBackground = isDark
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;
    final navBarSelected = isDark
        ? AppColors.primaryDark
        : AppColors.primaryLight;
    final navBarUnselected = isDark
        ? AppColors.secondaryDark
        : AppColors.secondaryLight;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,

      // ----------------------------------------------------
      // 🌞 تعريف الثيم الفاتح (Light Theme)
      // ----------------------------------------------------
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "Poppins",

        // الألوان (Color Scheme)
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryLight,
          secondary: AppColors.secondaryLight,
          background: AppColors.backgroundLight,
          surface: AppColors.backgroundLight,
          onBackground: AppColors.textLight,
          onPrimary: Colors.white,
        ),

        // تخصيص AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        // ✅ التصحيح: استخدام TextTheme العادي وتحديد اللون
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textLight),
          // سيتم تطبيق لون الخلفية الأساسي على Scaffold في كل صفحة
          // سيتم تطبيق لون النص الأساسي على النصوص في كل صفحة
        ),
      ),

      // ----------------------------------------------------
      // 🌙 تعريف الثيم الداكن (Dark Theme)
      // ----------------------------------------------------
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",

        // الألوان (Color Scheme)
        colorScheme: ColorScheme.dark(
          primary: AppColors.primaryDark,
          secondary: AppColors.secondaryDark,
          background: AppColors.backgroundDark,
          surface: AppColors.backgroundDark,
          onBackground: AppColors.textDark,
          onPrimary: Colors.white,
        ),

        // تخصيص AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        // ✅ التصحيح: استخدام TextTheme العادي وتحديد اللون
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textDark),
        ),
      ),

      // ----------------------------------------------------
      // هيكل التطبيق الرئيسي (Home Shell)
      // ----------------------------------------------------
      home: Scaffold(
        // 💡 استخدام IndexedStack لضمان بقاء حالة الصفحات
        body: IndexedStack(index: _currentIndex, children: _pages),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),

          // 💡 استخدام AppColors المحددة يدوياً للتحكم الدقيق في تصميم الناف بار
          backgroundColor: navBarBackground,
          selectedItemColor: navBarSelected,
          unselectedItemColor: navBarUnselected,

          items: [
            // ملاحظة: الأيقونات تستخدم ColorFilter لتطبيق اللون على SVG
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(
                'assets/icons/home-2.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? navBarSelected : navBarUnselected,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Courses',
              icon: SvgPicture.asset(
                'assets/icons/play.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1 ? navBarSelected : navBarUnselected,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Chats',
              icon: SvgPicture.asset(
                'assets/icons/message-text.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2 ? navBarSelected : navBarUnselected,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: SvgPicture.asset(
                'assets/icons/frame.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3 ? navBarSelected : navBarUnselected,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
