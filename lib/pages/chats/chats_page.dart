import 'package:flutter/material.dart';
import 'chat_detail.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    double font(double v) => v * width / 390;
    double h(double v) => v * height / 844;
    double w(double v) => v * width / 390;

    // الألوان من الثيم الحالي
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final background = theme.scaffoldBackgroundColor;
    final textColor = theme.textTheme.bodyMedium!.color;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            color: textColor,
            fontSize: font(25),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
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
                color: background,
                borderRadius: BorderRadius.circular(h(27.5)),
                border: Border.all(color: primary, width: 1),
              ),
              child: TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: textColor!.withOpacity(0.6)),
                  hintText: 'Search here',
                  hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
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
                      color: textColor,
                      fontSize: font(20),
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
                                style: TextStyle(
                                  fontSize: font(12),
                                  color: textColor,
                                ),
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
                      color: textColor,
                      fontSize: font(20),
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
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(height: h(4)),
                                  Text(
                                    'Last message preview...',
                                    style: TextStyle(
                                      fontSize: font(14),
                                      color: textColor.withOpacity(0.6),
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
                                color: textColor.withOpacity(0.6),
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
