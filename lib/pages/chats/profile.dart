import 'package:flutter/material.dart';
import 'package:our_flutter_project/pages/payment/my_account_fl.dart';
import 'package:our_flutter_project/pages/profile/negative.dart';
import 'package:our_flutter_project/pages/profile/notifications.dart';
import 'edit_profile_page.dart';
import '../../main.dart'; // 👈 للوصول إلى MyApp.of(context)

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 💡 تم حذف isDarkMode = false;
  // سنعتمد على Theme.of(context) لمعرفة حالة الثيم الحالية

  @override
  Widget build(BuildContext context) {
    // 💡 استخدام isDark مباشرة من الثيم
    final isDark = Theme.of(context).brightness == Brightness.dark;


    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      
      body: Stack(
        children: [
          // ===== محتوى الصفحة القابل للتمرير =====
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  'Ahmed',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    // 💡 استخدام onBackground للون النص الأساسي
                    color: colorScheme.onBackground,
                  ),
                ),
                Text(
                  'amoqiebel736@gmail.com',
                  // 💡 استخدام لون نص ثانوي
                  style: TextStyle(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // 💡 استخدام primaryColor
                    backgroundColor: colorScheme.primary,
                    foregroundColor:
                        colorScheme.onPrimary, // لون النص على primaryColor
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
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('edit profile'),
                ),
                const SizedBox(height: 20),

                // ===== مربعات الاحصائيات =====
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatBox(icon: Icons.menu_book, label: '15 Courses'),
                      _StatBox(icon: Icons.star, label: '4.9 Reviews'),
                      _StatBox(icon: Icons.access_time, label: '21 Hours'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ===== خيارات القائمة =====
                _OptionTile(
                  icon: Icons.dark_mode,
                  title: 'Dark Mode',
                  hasSwitch: true,
                  // 💡 القيمة الأولية للسويتش: هي حالة الثيم الحالية (isDark)
                  switchValue: isDark,
                  onSwitchChanged: (val) {
                    // 🔥 عند التبديل، نغير الثيم فقط في MyApp
                    MyApp.of(context)?.toggleTheme(val);
                    // 💡 لا نحتاج لـ setState هنا لأن تغيير الثيم سيقوم بإعادة بناء (rebuild) كل الـ Widgets تلقائياً
                  },
                ),
                _OptionTile(
                  icon: Icons.payment,
                  title: 'Payment Details',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountFl())),
                  
                ),
                _OptionTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage())),
                ),
                _OptionTile(
                  icon: Icons.star_border,
                  title: 'Rate & Review',
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NegativeReviewsPage())),
                ),
                const _OptionTile(icon: Icons.help_outline, title: 'Help'),
                const SizedBox(height: 40),
              ],
            ),
          ),

          // ===== AppBar متدرج =====
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.07, -0.06),
                end: const Alignment(0.65, 0.87),
                // 💡 استخدام الألوان الثابتة المتدرجة (Gradient)
                colors: isDark
                    ? const [
                        Color(0xFF861B13),
                        Color(0xFFCA352B),
                      ] // ألوان أغمق للداكن
                    : const [
                        Color(0xFFD44035),
                        Color(0xFFF16055),
                      ], // ألوان أفتح للفاتح
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            alignment: const Alignment(0, 0.4),
            child: Text(
              'Profile',
              style: textTheme.headlineSmall?.copyWith(
                // استخدام نمط نص من الثيم
                fontWeight: FontWeight.bold,
                color: Colors.white, // النص يبقى أبيض على خلفية متدرجة داكنة
              ),
            ),
          ),

          // ===== صورة البروفايل =====
          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: colorScheme.background, // لون خلفية الثيم
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

// ===== مربع احصائيات =====
class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatBox({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    // 💡 الاعتماد على ColorScheme
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

// ===== عنصر خيار قائمة =====
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
    // 💡 الاعتماد على ColorScheme
    final iconColor = Theme.of(context).colorScheme.primary;

    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          // 💡 استخدام onBackground كلون نص أساسي
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      trailing: hasSwitch
          ? Switch(
              value: switchValue ?? false,
              activeColor: iconColor,
              onChanged: onSwitchChanged,
            )
          : Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),
      onTap: onTap,
    );
  }
}
