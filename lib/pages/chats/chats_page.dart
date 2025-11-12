import 'package:flutter/material.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'chat_detail.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    double font(double v) => v * width / 390;
    double h(double v) => v * height / 844;
    double w(double v) => v * width / 390;

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Chats',
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: font(24),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: h(100),
      ),

      body: Column(
        children: [
          // خانة البحث
          Padding(
            padding: EdgeInsets.all(w(16)),
            child: Container(
              height: h(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF3F2),
                borderRadius: BorderRadius.circular(h(27.5)),
                border: Border.all(color: AppColors.primaryLight, width: 1),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: w(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Active",
                    style: TextStyle(
                      color: const Color(0xff0F0606),
                      fontSize: font(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: h(16)),

                  // صور المتصلين
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        7,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: w(12)),
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  width: w(60),
                                  height: w(60),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: h(6)),
                              Text(
                                'User $index',
                                style: TextStyle(fontSize: font(12)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: h(28)),
                  Text(
                    "Messages",
                    style: TextStyle(
                      color: const Color(0xff0F0606),
                      fontSize: font(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: h(16)),

                  // قائمة الرسائل
                  for (int i = 0; i < 20; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailPage(
                              userName: 'User $i',
                              userImage: 'assets/images/profile.png',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: h(8)),
                        padding: EdgeInsets.symmetric(
                          horizontal: w(12),
                          vertical: h(8),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(w(30)),
                              child: Image.asset(
                                'assets/images/profile.png',
                                width: w(50),
                                height: w(50),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: w(12)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User $i',
                                    style: TextStyle(
                                      fontSize: font(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: h(4)),
                                  Text(
                                    'Last message preview...',
                                    style: TextStyle(
                                      fontSize: font(14),
                                      color: Colors.grey[600],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '12:${i.toString().padLeft(2, '0')} PM',
                              style: TextStyle(
                                fontSize: font(12),
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
