import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final colorScheme = Theme.of(context).colorScheme;
    final textOnBackground = colorScheme.onBackground;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: colorScheme.background, 
        elevation: 0,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: textOnBackground,
          ), // لون الأيقونة يتغير مع الثيم
          onPressed: () => Navigator.pop(context),
        ),

        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            // 💡 
            color: textOnBackground,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/images/profile.png'),
              // 💡 يجب أن تكون الخلفية متوافقة مع الثيم الفاتح/الداكن
              backgroundColor: colorScheme.surface,
            ),
            const SizedBox(height: 16),
            Text(
              'Ahmed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textOnBackground, // 💡 لون النص الأساسي
              ),
            ),
            Text(
              'amoqiebel736@gmail.com',
              // 💡 لون نص ثانوي (لون نص الخلفية مع شفافية)
              style: TextStyle(color: textOnBackground.withOpacity(0.6)),
            ),
            const SizedBox(height: 30),

            // عناصر الإعدادات
            const _EditOption(icon: Icons.person_outline, title: 'Edit Name'),
            const _EditOption(
              icon: Icons.lock_outline,
              title: 'Change Password',
            ),
            const _EditOption(
              icon: Icons.security,
              title: 'Security and Privacy',
            ),

            const SizedBox(height: 40),

            // زر تسجيل الخروج
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // 💡 اللون الأحمر الثابت (للتنبيه/الخروج)
                backgroundColor: const Color(0xFFD44035),
                foregroundColor: Colors.white, // النص يبقى أبيض
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                // ضع كود تسجيل الخروج هنا
              },
              child: const Text('Log out', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// عنصر الخيار في الصفحة
class _EditOption extends StatelessWidget {
  final IconData icon;
  final String title;

  // 💡 يجب أن يكون المنشئ ثابتاً (Const) لتجنب الأخطاء
  const _EditOption({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    // 💡 استخدام اللون الأساسي (Primary) لـ Theme.of(context)
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textOnBackground = Theme.of(context).colorScheme.onBackground;

    return ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
      ), // 💡 الأيقونة بلون الثيم الأساسي
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textOnBackground, // 💡 النص بلون متوافق مع الثيم
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: primaryColor,
      ), // 💡 الأيقونة بلون الثيم الأساسي
      onTap: () {
        // اضف التنقل لصفحات التعديل الخاصة بكل خيار
      },
    );
  }
}
