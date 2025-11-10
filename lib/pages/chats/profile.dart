import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'package:our_flutter_project/pages/payment/my_account_fl.dart';
import 'package:our_flutter_project/pages/profile/negative.dart';
import 'package:our_flutter_project/pages/profile/notifications.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 200), 
            child: Column(
              children: [
                const SizedBox(height: 60), 
                const Text(
                  'Ahmed',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight,
                  ),
                ),
                const Text(
                  'amoqiebel736@gmail.com',
                  style: TextStyle(color: AppColors.textLight),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryLight,
                    foregroundColor: AppColors.backgroundLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfilePage(),
                      ),
                    );
                  },
                  icon: const Icon(Iconsax.edit),
                  label: const Text('edit profile'),
                ),
                const SizedBox(height: 20),

                // ===== مربعات الاحصائيات =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _StatBox(icon: Iconsax.book, label: '15 Courses'),
                      _StatBox(icon: Iconsax.star1, label: '4.9 Reviews'),
                      _StatBox(icon: Iconsax.clock, label: '21 Hours'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ===== خيارات القائمة =====
                const _OptionTile(
                  icon: Iconsax.moon,
                  title: 'Dark Mode',
                  hasSwitch: true,
                ),
                _OptionTile(
                  icon: Iconsax.wallet,
                  title: 'Payment Details',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountFl())),
                  
                ),
                _OptionTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage())),
                ),
                _OptionTile(
                  icon: Iconsax.star,
                  title: 'Rate & Review',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NegativeReviewsPage())),
                ),
                const _OptionTile(icon: Iconsax.message_question, title: 'Help'),
                const SizedBox(height: 40),
              ],
            ),
          ),

          
          Container(
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.07, -0.06),
                end: Alignment(0.65, 0.87),
                colors: [AppColors.primaryLight, AppColors.secondaryLight],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            alignment: const Alignment(0, 0.4),
            child: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundLight,
              ),
            ),
          ),

          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.backgroundLight,
              child: const CircleAvatar(
                radius: 46,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// مربع احصائيات
class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatBox({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color:AppColors.primaryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.backgroundLight, size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: AppColors.backgroundLight, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// عنصر خيار قائمة
class _OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool hasSwitch;
  final bool? switchValue;
  final Function(bool)? onSwitchChanged;
  final Function()? onTap;

  const _OptionTile({
    required this.icon,
    required this.title,
    this.hasSwitch = false,
    this.switchValue,
    this.onSwitchChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryLight),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: hasSwitch
          ? Switch(
              value: switchValue ?? false,
              activeColor: AppColors.primaryLight,
              onChanged: onSwitchChanged,
            )
          : const Icon(
              Iconsax.arrow_right_3,
              size: 16,
              color: AppColors.primaryLight,
            ),
      onTap: onTap,
    );
  }
}
