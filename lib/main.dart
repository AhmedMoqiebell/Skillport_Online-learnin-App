import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'package:our_flutter_project/providers/auth_provider.dart';
import 'package:our_flutter_project/pages/splash/splashscreen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: const RootApp(),
      ),
    );

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primaryLight,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
