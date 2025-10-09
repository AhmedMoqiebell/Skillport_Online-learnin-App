import 'package:flutter/material.dart';
import 'Lessons.dart';

class CoursesPage extends StatefulWidget {
  @override
  State<CoursesPage> createState() => _My_CoursesState();
}

class _My_CoursesState extends State<CoursesPage> {
  String selectedTab = 'All'; // التبويب الحالي

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: MaterialButton(
          onPressed: () {},
          child: const Icon(Icons.chevron_left, size: 60),
        ),
        title: const Text(
          'My Courses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // العنوان العلوي
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 172,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFFEA3404), Color(0xFFEE5A51)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    // النصوص على اليسار
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "15 Courses You\n Purchasing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Completed Courses",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 180,
                          child: LinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.redAccent,
                            ),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Container(
                        width: 145,
                        height: 135,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/photo2.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // النص "Your Purchased Courses"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Purchased Courses',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // أزرار التبويبات
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              // زر All
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = 'All';
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: selectedTab == 'All'
                        ? const LinearGradient(
                            colors: [Color(0xFFE53A0F), Color(0xFFDB5945)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: selectedTab == 'All' ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // زر Completed
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = 'Completed';
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: selectedTab == 'Completed'
                        ? const LinearGradient(
                            colors: [Color(0xFFE53A0F), Color(0xFFDB5945)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                  ),
                  child: Text(
                    'Completed',
                    style: TextStyle(
                      color: selectedTab == 'Completed'
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // محتوى التبويبات
          Expanded(
            child: selectedTab == 'All'
                ? buildAllCourses(context)
                : buildCompletedCourses(context),
          ),
        ],
      ),
    );
  }

  // 🔹 محتوى تبويب All
  Widget buildAllCourses(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("UX_UI"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/UX_UI.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'UX_UI',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("program"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/program.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'program',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("english"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/english.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'English',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("network"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/network.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Network',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("security"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/security.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Security',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("flutter"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flutter.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Flutter',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("UX_UI"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/UX_UI.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'UX_UI',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("program"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/program.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'program',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("english"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/english.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'English',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("network"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/network.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Network',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("security"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/security.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Security',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("flutter"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flutter.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Flutter',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("UX_UI"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/UX_UI.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'UX_UI',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("program"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/program.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'program',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("english"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/english.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'English',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("network"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/network.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Network',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("security"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/security.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Security',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("flutter"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flutter.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Flutter',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🔹 محتوى تبويب Completed
  Widget buildCompletedCourses(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("english"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/english.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'English',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("network"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/network.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Network',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("security"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/security.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Security',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("flutter"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flutter.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Flutter',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("UX_UI"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/UX_UI.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'UX_UI',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("program"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/program.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'program',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("english"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/english.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'English',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("network"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/network.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Network',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("security"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/security.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Security',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("flutter"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flutter.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Flutter',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("UX_UI"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/UX_UI.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'UX_UI',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("program"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/program.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'program',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("english"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/english.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'English',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("network"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/network.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Network',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("security"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/security.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Security',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("flutter"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/flutter.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Flutter',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("UX_UI"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/UX_UI.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'UX_UI',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Lessons("program"),
                        ),
                      );
                    },
                    child: Container(
                      height: 171,
                      width: 191,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                          // begin: Alignment.topLeft,
                          // end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/program.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'program',

                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  child: LinearProgressIndicator(
                                    value: 0.99,
                                    backgroundColor: Colors.white, //
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.redAccent,
                                    ),
                                    minHeight: 8,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 80,)
                            ],
                          ),
                          SizedBox(height: 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('64 Videos', style: TextStyle(fontSize: 10)),
                              Text('80 Quiz', style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
