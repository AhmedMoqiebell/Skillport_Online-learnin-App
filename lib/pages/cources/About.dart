import 'package:flutter/material.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'courses_page.dart';
import 'Payment.dart';

class About extends StatelessWidget {
  const About({super.key}); // 💡 أضف const و super.key

  @override
  Widget build(BuildContext context) {
    // استخدام ألوان المشروع من AppColors
    final primaryGradient = const [AppColors.primaryLight, AppColors.secondaryLight];
    const cardBackgroundColor = AppColors.backgroundLight;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ألوان من AppColors
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.textLight, // لون الأيقونات والنصوص
        elevation: 0,
        automaticallyImplyLeading: true,
        // leading: IconButton(
        //
        //   icon: const Icon(Iconsax.arrow_left, size: 24, color: AppColors.textLight),
        //   onPressed: () {
        //
        //     Navigator.pop(context);
        //
        //
        //   },
        // ),
        title: const Text(
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
                  height: 312,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // 💡 لون خلفية الحاوية يتغير
                    color: cardBackgroundColor,
                    boxShadow: [
                      // 💡 تعديل ظل الصندوق ليتوافق مع الثيم الداكن
                      BoxShadow(
                        color: AppColors.textLight.withOpacity(0.2),
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
                        height: 240,
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
                            const Icon(Iconsax.play_circle, size: 60, color: AppColors.backgroundLight),
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

                      const SizedBox(height: 13),

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
                                  const Icon(Iconsax.profile_2user, size: 37, color: AppColors.textLight),
                                  const SizedBox(width: 4),
                                  Text(
                                    "23.5K",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textLight, // 💡 نص ديناميكي
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Icon(Iconsax.star1, size: 19, color: AppColors.primaryLight),
                                  const SizedBox(width: 4),
                                  Text(
                                    "4.9",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textLight, // 💡 نص ديناميكي
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

              const SizedBox(height: 20),

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
                        // color: colorScheme.onBackground, // 💡 نص ديناميكي
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Master the fundamentals of UI/UX design, including wireframing, prototyping, and user research, to build intuitive, engaging digital products that prioritize usability, accessibility, and user satisfaction.",
                      style: TextStyle(
                        fontSize: 14,
                        // color: colorScheme.onBackground.withOpacity(0.7),
                      ), // 💡 نص ثانوي ديناميكي
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // ** معلومات الدروس والـ BUY NOW **
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // رمز التشغيل وعدد الدروس
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
                              colors: primaryGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(Iconsax.play_circle, color: AppColors.backgroundLight, size: 40),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "63 Lesson",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.textLight,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "64 Videos • 30 Sheets • 80 Quiz",
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.textLight.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // ** السعر وزر الشراء **
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLight,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textLight.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$120",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textLight,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryLight,
                              foregroundColor: AppColors.backgroundLight,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Payment()),
                              );
                            },
                            child: const Text("Enroll Now"),
                          ),
                        ],
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
