import 'package:flutter/material.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'courses_page.dart';
import 'Payment.dart';

class About extends StatelessWidget {
  const About({super.key}); // 💡 أضف const و super.key

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryGradient = isDark
        ? const [Color(0xFF861B13), Color(0xFFCA352B)]
        : const [Color(0xFFE53A0F), Color(0xFFDB5945)];

    final cardBackgroundColor = isDark ? colorScheme.surface : AppColors.backgroundLight;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // 💡 استخدام ألوان الثيم (AppBarTheme المعرفة في main.dart)
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onBackground, // لون الأيقونات والنصوص
        elevation: 0,

        leading: IconButton(
          // 💡 استبدال MaterialButton بـ IconButton
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color:AppColors.textLight,
          ),
          onPressed: () {
            // استخدام pop إذا كان الانتقال للوراء
            Navigator.pop(context);
            // أو استخدم push كما كنت تفعل:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesPage()));
          },
        ),
        title: Text(
          'About Courses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: AppColors.textLight, // 💡 لون النص يتغير
          ),
        ),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // 💡 لون خلفية الحاوية يتغير
                    color: cardBackgroundColor,
                    boxShadow: [
                      // 💡 تعديل ظل الصندوق ليتوافق مع الثيم الداكن
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withOpacity(0.5)
                            : Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 312,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            // 💡 استخدام التدرج الديناميكي
                            colors: primaryGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.play_circle_fill,
                              size: 60,
                              color: AppColors.backgroundLight,
                            ),
                            Positioned(
                              // 💡 لضمان أن يكون النص في مكانه الصحيح
                              bottom: 20,
                              child: const Text(
                                "How to get started",
                                style: TextStyle(
                                  color: AppColors.backgroundLight,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ======= شريط الإحصائيات =======
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ** BEST SELLING **
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    colors: primaryGradient,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: const Text(
                                  "BEST SELLING",
                                  style: TextStyle(
                                    color: AppColors.backgroundLight,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // ** إحصائيات الطلاب والتقييمات **
                              Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 14,
                                    color: colorScheme.onBackground,
                                  ), // 💡 أيقونة ديناميكية
                                  const SizedBox(width: 4),
                                  Text(
                                    "23.5K",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme
                                          .onBackground, // 💡 نص ديناميكي
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: AppColors.primaryLight,
                                  ), // 💡 أيقونة ديناميكية بلون أساسي
                                  const SizedBox(width: 4),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme
                                          .onBackground, // 💡 نص ديناميكي
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 2),

              // ** وصف الدورة **
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UX UI Design",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onBackground, // 💡 نص ديناميكي
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Master the fundamentals of UI/UX design, including wireframing, prototyping, and user research, to build intuitive, engaging digital products that prioritize usability, accessibility, and user satisfaction.",
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onBackground.withOpacity(0.7),
                      ), // 💡 نص ثانوي ديناميكي
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // ** معلومات الدروس والـ BUY NOW **
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // رمز التشغيل وعدد الدروس (تم تبسيط هذا الجزء قليلاً ليكون أسهل للقراءة)
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              // 💡 التدرج الديناميكي
                              colors: primaryGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.play_arrow_outlined,
                            color: AppColors.backgroundLight,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "63 Lesson",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color:
                                    colorScheme.onBackground, // 💡 نص ديناميكي
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "64 Videos • 30 Sheets • 80 Quiz",
                              style: TextStyle(
                                fontSize: 10,
                                color: colorScheme.onBackground.withOpacity(
                                  0.6,
                                ), // 💡 نص ثانوي ديناميكي
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // ** السعر وزر الشراء **
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryLight, // 💡 استخدام اللون الأساسي
                        foregroundColor: AppColors.secondaryLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Payment()),
                        );
                      },
                      child: const Text(
                        "BUY NOW \$120", // 💡 جمعنا السعر مع الزر لتصحيح التصميم
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
