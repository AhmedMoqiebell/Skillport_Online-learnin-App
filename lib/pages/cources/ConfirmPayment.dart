import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Payment.dart';
import 'courses_page.dart';

class Confirm_Payment extends StatefulWidget {
  @override
  _Confirm_PaymentState createState() => _Confirm_PaymentState();
}

class _Confirm_PaymentState extends State<Confirm_Payment> {
  bool _showConfirmation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: MaterialButton(
          onPressed: () {
            if (_showConfirmation) {
              setState(() {
                _showConfirmation = false;
              });
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            }
          },
          child: const Icon(Icons.chevron_left, size: 60),
        ),
        title: const Text(
          'Confirm Payment',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 190,
                      width: 316,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 17,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ahmed",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'OLIVIA RHYE',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 60),
                                        Text(
                                          '06/24 ',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '1234 1234 1234 1234 ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 20,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/wi.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: 45,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/images/master_c.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please fill the form',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        SizedBox(height: 42),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Expiration date ',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: 'CCV',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 42),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Card Holder Name',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        SizedBox(height: 42),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('TOTAL', style: TextStyle(fontSize: 16)),
                                Text(
                                  '\$120.00',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Center(
                          child: Container(
                            width: 159,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.red,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _showConfirmation = true;
                                });
                              },
                              child: Text(
                                'Confirm Payment',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(height: 160),
                ],
              ),
            ),
          ),

          // تاب تاكيد الدفع يغطي الشاشة كاملة من الأسفل والجانبين
          if (_showConfirmation)
            Positioned(
              top: 20, // يبدأ من أعلى الشاشة (تحت الـ AppBar)
              left: 0,
              right: 0,
              bottom: 0, // يصل إلى أسفل الشاشة
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  children: [
                    // مساحة فارغة في الأعلى للإبقاء على الـ AppBar مرئي
                    SizedBox(height: 240),

                    // محتوى تاب التأكيد
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 35),
                                Text(
                                  'Congratulations! You have\npurchased a new course',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 296,
                                  height: 296,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/images/people.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Container(
                                  width: 223,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CoursesPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Back to home',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
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
