import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'package:our_flutter_project/pages/home/homepage.dart';
import 'package:our_flutter_project/pages/cources/courses_page.dart';
import 'package:our_flutter_project/pages/chats/chats_page.dart';
import 'package:our_flutter_project/pages/chats/profile.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(username: ''),
    CoursesPage(),
    ChatsPage(),
    ProfilePage(),
  ];

  final List<_NavItemData> _items = const [
    _NavItemData('assets/icons/home-2.svg', 'Home'),
    _NavItemData('assets/icons/play.svg', 'Courses'),
    _NavItemData('assets/icons/message-text.svg', 'Chats'),
    _NavItemData('assets/icons/frame.svg', 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              spreadRadius: 0,
              offset: Offset(0, -2),
            ),
          ],
          
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final bool isSelected = index == _currentIndex;

            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => setState(() => _currentIndex = index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    SvgPicture.asset(
                      item.icon,
                      width: 26,
                      height: 26,
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? AppColors.primaryLight
                            : AppColors.secondaryLight,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: isSelected ? 13 : 12,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: isSelected
                            ? AppColors.primaryLight
                            : AppColors.secondaryLight,
                      ),
                    ),
                    SizedBox(height: 10,),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 4,
                      width: 70,
                      margin: const EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColors.primaryLight : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String icon;
  final String label;

  const _NavItemData(this.icon, this.label);
}

