import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:our_flutter_project/theme/app_colors.dart';
import 'package:our_flutter_project/pages/payment/my_account_fl.dart';
import 'package:our_flutter_project/providers/auth_provider.dart';
import 'package:our_flutter_project/pages/registration/sginin.dart';
import 'package:our_flutter_project/pages/cources/About.dart';
import 'package:our_flutter_project/pages/profile/notifications.dart';
import 'package:our_flutter_project/pages/chats/profile.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backgroundLight, // لون الخلفية
      // Right-side drawer
      endDrawer: Drawer(
        backgroundColor: AppColors.backgroundLight,
        child: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context, auth, _) {
              final bool isLoggedIn = auth.isLoggedIn;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: AppColors.secondaryLight,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.backgroundLight,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isLoggedIn
                                    ? (auth.userEmail?.split('@').first ?? 'User')
                                    : 'Guest',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isLoggedIn
                                    ? (auth.userEmail ?? 'user@example.com')
                                    : 'Please sign in',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLoggedIn) ...[
                    ListTile(
                      leading: const Icon(Iconsax.login),
                      title: const Text('Sign In'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Signin()),
                        );
                      },
                    ),
                  ] else ...[
                    ListTile(
                      leading: const Icon(Iconsax.notification),
                      title: const Text('Notifications'),
                      onTap: () {
                        Navigator.pop(context);
                        _requireLogin(context, () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NotificationPage(),
                            ),
                          );
                        });
                      },
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.user),
                      title: const Text('Profile'),
                      onTap: () {
                        Navigator.pop(context);
                        _requireLogin(context, () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfilePage(),
                            ),
                          );
                        });
                      },
                    ),
                    ListTile(
                      leading: const Icon(Iconsax.wallet),
                      title: const Text('Payment Info'),
                      onTap: () {
                        Navigator.pop(context);
                        _requireLogin(context, () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyAccountFl(),
                            ),
                          );
                        });
                      },
                    ),
                    const Spacer(),
                    ListTile(
                      leading: const Icon(Iconsax.logout),
                      title: const Text('Sign Out'),
                      onTap: () {
                        Navigator.pop(context);
                        context.read<AuthProvider>().logout();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signed out')),
                        );
                      },
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الجزء العلوي مع صورة البروفايل + الايقونة
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryLight, AppColors.secondaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey ${widget.username},",
                              style: const TextStyle(
                                color: AppColors.backgroundLight,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Let’s Start Learning",
                              style: TextStyle(
                                color: AppColors.backgroundLight,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        // Menu button to open right-side drawer
                        IconButton(
                          icon: const Icon(
                            Iconsax.menu,
                            color: AppColors.backgroundLight,
                            size: 28,
                          ),
                          onPressed: () =>
                              _scaffoldKey.currentState?.openEndDrawer(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    // صندوق البحث
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLight,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "search anything",
                          border: InputBorder.none,
                          icon: Icon(
                            Iconsax.search_normal,
                            color: AppColors.textLight.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Ongoing Course
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Ongoing Course",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(color: AppColors.primaryLight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Scroll أفقي للكروت
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // عدد الكروت
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 280,
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryLight,
                            AppColors.secondaryLight,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),

                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // top row: image + texts
                          Row(
                            children: [
                              
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/english.jpg',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // النصوص يمين
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Foundation of Google UX UI design",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.backgroundLight,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      "64 Videos · 30 Shift · 80 Quiz",
                                      style: TextStyle(
                                        color: AppColors.backgroundLight,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // progress bar at bottom spanning the card
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: double.infinity,
                              height: 6,
                              child: LinearProgressIndicator(
                                value: 47 / 64,
                                backgroundColor: AppColors.backgroundLight,
                                color: AppColors.secondaryLight
                                    ,
                                minHeight: 8,
                              ),
                            ),
                            
                          ),
                          
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Choose Your Course
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Choose Your Course",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(color: AppColors.primaryLight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 3 / 3.6,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const About()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLight,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.textLight.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.asset(
                              'assets/images/english.jpg',
                              height: 90,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "UI UX Design",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Row(
                                  children: List.generate(
                                    5,
                                    (star) => const Icon(
                                      Iconsax.star1,
                                      color: Colors.amber,
                                      size: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "64 Videos · 80 Quiz",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textLight.withOpacity(0.6),
                              ),
                            ),
                          ),
                          
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _requireLogin(
  BuildContext context,
  Future<void> Function() action,
) async {
  final isLoggedIn = context.read<AuthProvider>().isLoggedIn;
  if (isLoggedIn) {
    await action();
    return;
  }
  await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Sign in required'),
      content: const Text('Please sign in to access this feature.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Signin()),
            );
          },
          child: const Text('Sign In'),
        ),
      ],
    ),
  );
}
