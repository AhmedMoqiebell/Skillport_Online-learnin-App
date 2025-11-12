import 'package:flutter/material.dart';
import 'About.dart';
import 'ConfirmPayment.dart';
import 'package:our_flutter_project/theme/app_colors.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int selectedIndex = -1;

  final paymentMethods = [
    {"title": "Credit Card", "icon": "assets/images/card.png"},
    {"title": "Google Pay", "icon": "assets/images/google.png"},
    {"title": "Apple Pay", "icon": "assets/images/apple.png"},
    {"title": "Paypal", "icon": "assets/images/paypal.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundLight,
        automaticallyImplyLeading: true,
        // leading: MaterialButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => About()),
        //     );
        //   },
        //   child: const Icon(Icons.chevron_left, size: 60),
        // ),
        title: const Text(
          'Payment',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.backgroundLight,
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 102,
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 10,
                      spreadRadius: 0.6,
                      offset: Offset(1, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 102,
                          height: 102,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/UX_UI.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "UX UI Design",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Learn more about how to build Design system and UI Design",
                              style: TextStyle(
                                fontSize: 12,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose Your Method",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textLight),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(paymentMethods.length, (index) {
                final method = paymentMethods[index];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      if (method["title"] == "Credit Card") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Confirm_Payment(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 63,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundLight,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(method["icon"]!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                method["title"]!,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textLight,
                                ),
                              ),
                            ),
                            Icon(
                              selectedIndex == index
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: AppColors.primaryLight,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
