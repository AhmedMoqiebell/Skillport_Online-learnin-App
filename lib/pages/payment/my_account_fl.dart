import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyAccountFl extends StatefulWidget {
  const MyAccountFl({super.key});

  @override
  State<MyAccountFl> createState() => _MyAccountFlState();
}

class _MyAccountFlState extends State<MyAccountFl> {
  // 🎨 الألوان والثوابت
  static const bg = Color(0xFFFAF1ED);
  static const textMain = Color(0xFF1F1F1F);
  static const textSub = Color(0xFF8A8A8A);
  static const border = Color(0xFFE8DCD6);
  static const red = Color(0xFFE65647);
  static const purple = Color(0xFF9C27B0);
  static const cardA = Color(0xFFF0625E);
  static const cardB = Color(0xFFEA4C4C);
  static const chipBlue = Color(0xFF2D66F8);
  static const maxW = 430.0;

  // 📊 بيانات الرسم لكل شهر
  final List<List<FlSpot>> _monthData = [
    // Oct
    const [FlSpot(0, 0.25), FlSpot(1, 0.22), FlSpot(2, 0.28), FlSpot(3, 0.25)],
    // Nov
    const [FlSpot(0, 0.20), FlSpot(1, 0.26), FlSpot(2, 0.22), FlSpot(3, 0.30)],
    // Dec (القمة)
    const [FlSpot(0, 0.30), FlSpot(1, 0.45), FlSpot(2, 1.00), FlSpot(3, 0.75)],
    // Jan
    const [FlSpot(0, 0.55), FlSpot(1, 0.40), FlSpot(2, 0.30), FlSpot(3, 0.37)],
  ];

  int _selected = 2; // يبدأ على Dec
  final List<String> _yLabels = const ['150000.00', '112500.00', '75000.00', '37500.00', '0.00'];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);

    return MediaQuery(
      data: mq,
      child: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: maxW),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                children: [
                  // الهيدر
                  Row(children: const [
                    _BackBtn(),
                    SizedBox(width: 8),
                    Text('My Account',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: textMain)),
                  ]),
                  const SizedBox(height: 16),

                  // الكارت العلوي
                  const _CreditCard(),
                  const SizedBox(height: 18),

                  // مؤشرات كارووسيل
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _dot(true),
                    const SizedBox(width: 10),
                    _dot(false),
                    const SizedBox(width: 10),
                    _dot(false),
                  ]),
                  const SizedBox(height: 22),

                  const Text('Statistic',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: textMain)),
                  const SizedBox(height: 6),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text('Total visits',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: textMain)),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // الرسم البياني
                  SizedBox(
                    height: 220,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // الأرقام يسار
                        SizedBox(
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: _yLabels
                                .map((t) => Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(t,
                                          style: const TextStyle(
                                              color: Color(0xFFCFC9C5),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600)),
                                    ))
                                .toList(),
                          ),
                        ),
                        // الرسم باستخدام fl_chart
                        Expanded(
                          child: LineChart(
                            LineChartData(
                              minX: 0,
                              maxX: 3,
                              minY: 0,
                              maxY: 1.1,
                              gridData: const FlGridData(show: false),
                              titlesData: const FlTitlesData(show: false),
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: _monthData[_selected],
                                  isCurved: true,
                                  barWidth: 3,
                                  gradient: const LinearGradient(colors: [red, purple]),
                                  dotData: FlDotData(
                                    show: true,
                                    getDotPainter: (s, p, b, i) {
                                      final isPeak = _selected == 2 && i == 2;
                                      return FlDotCirclePainter(
                                        radius: isPeak ? 3.5 : 0,
                                        color: Colors.white,
                                        strokeWidth: 3,
                                        strokeColor: red,
                                      );
                                    },
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [red.withOpacity(.22), Colors.transparent],
                                    ),
                                  ),
                                ),
                              ],
                              extraLinesData: ExtraLinesData(
                                verticalLines: [
                                  VerticalLine(
                                    x: 2, // Dec
                                    color: const Color(0x228A8A8A),
                                    strokeWidth: 1,
                                  ),
                                ],
                              ),
                            ),
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // الأشهر
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (i) {
                      final labels = ['Oct', 'Nov', 'Dec', 'Jan'];
                      final sel = _selected == i;
                      return InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => setState(() => _selected = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: sel ? chipBlue : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            labels[i],
                            style: TextStyle(
                              color: sel ? Colors.white : textSub,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 22),

                  const Text('Recent Transactions',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: textMain)),
                  const SizedBox(height: 14),

                  const _TxTile(title: 'UI UX Design', amount: 120.0, isOut: false),
                  const _TxTile(title: 'UI UX Design', amount: 120.0, isOut: true),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _dot(bool active) => Container(
        width: active ? 38 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: active ? red : const Color(0xFFE0B3AE),
          borderRadius: BorderRadius.circular(8),
        ),
      );
}

/* ------------------------------------------------------------------ */

class _BackBtn extends StatelessWidget {
  const _BackBtn({super.key});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.maybePop(context),
        borderRadius: BorderRadius.circular(24),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(Icons.arrow_back_ios_new_rounded, size: 22, color: Colors.black87),
        ),
      );
}

/* -------------------- بطاقة الكريدت المعدلة -------------------- */
class _CreditCard extends StatelessWidget {
  const _CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 190),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [_MyAccountFlState.cardA, _MyAccountFlState.cardB],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(color: Color(0x33000000), blurRadius: 18, offset: Offset(0, 10)),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Ahmed',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.graphic_eq, size: 18, color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // OLIVIA RHYE جنبها 06/24 (بدون Spacer)
          Row(
            children: const [
              Text('OLIVIA RHYE',
                  style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
              SizedBox(width: 16),
              Text('06/24',
                  style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w700)),
            ],
          ),

          const SizedBox(height: 10),

          // رقم البطاقة يسار + شعار الماستركارد يمين داخل مستطيل خافت
          Row(
            children: [
              const Expanded(
                child: Text(
                  '1234 1234 1234 1234',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: const [
                    SizedBox(width: 42, height: 22),
                    Positioned(right: 6,
                      child: CircleAvatar(radius: 9, backgroundColor: Color(0xFFF6A623))),
                    Positioned(right: 14,
                      child: CircleAvatar(radius: 9, backgroundColor: Color(0xFFFF4D4F))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

  


/* ------------------ العناصر السفلية للمعاملات ------------------ */

class _TxTile extends StatelessWidget {
  final String title;
  final double amount;
  final bool isOut;
  const _TxTile({super.key, required this.title, required this.amount, required this.isOut});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _MyAccountFlState.border, width: 1.2),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 18, backgroundColor: _MyAccountFlState.red),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title,
                style: const TextStyle(color: _MyAccountFlState.textMain, fontWeight: FontWeight.w700)),
          ),
          Text(
            (isOut ? '-\$' : '\$') + amount.toStringAsFixed(2),
            style: TextStyle(
              color: isOut ? Colors.green : _MyAccountFlState.textMain,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
