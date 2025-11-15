


import 'package:flutter/material.dart';
import 'positive.dart'; // للتبديل عند الضغط على Positive

class NegativeReviewsPage extends StatelessWidget {
  NegativeReviewsPage({super.key});

  // نفس الألوان/القياسات لضمان التطابق
  static const bg = Color(0xFFFAF1ED);
  static const card = Colors.white;
  static const border = Color(0xFFE3DCD7);
  static const textMain = Color(0xFF1F1F1F);
  static const textSub  = Color(0xFF8A8A8A);
  static const btn      = Color(0xFFE65647);
  static const maxW = 430.0;

  // بيانات static مؤقتة سلبية
  final double _avg = 4.0; // معروض نفسه في الموك
  final List<Map<String, dynamic>> _items = List.generate(2, (_) => {
        'author': 'Ahmed Moqbel',
        'rating': 4.0,
        'time': '1 day ago',
        'body':
            'Though five-star ratings are a beacon of success, they alone cannot narrate the full story of your stellar services...',
        'avatar': null,
      });

  @override
  Widget build(BuildContext context) {
    final fixed = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);

    return MediaQuery(
      data: fixed,
      child: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: maxW),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                children: [
                  Row(children: const [
                    _BackBtn(), SizedBox(width: 8),
                    Text('Reviews', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textMain)),
                  ]),
                  const SizedBox(height: 16),

                  // Tabs (Negative selected)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _Chip(
                      label: 'Positive',
                      selected: false,
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => PositiveReviewsPage()),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _Chip(label: 'Negative', selected: true, onTap: null),
                  ]),
                  const SizedBox(height: 12),

                  _AvgCard(avg: _avg),
                  const SizedBox(height: 16),

                  for (final r in _items) _ReviewCard(data: r),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btn,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      child: const Text('Write a Review', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// نفس الودجتس الصغيرة (مكررة للتبسيط واستقلال الملف)
class _BackBtn extends StatelessWidget {
  const _BackBtn({super.key});
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.maybePop(context),
        borderRadius: BorderRadius.circular(24),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(Icons.arrow_back, size: 22, color: Colors.black87),
        ),
      );
}

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const _Chip({super.key, required this.label, required this.selected, this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? NegativeReviewsPage.btn : const Color(0xFFF2E8E3),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(label,
              style: TextStyle(
                  color: selected ? Colors.white : NegativeReviewsPage.textMain,
                  fontWeight: FontWeight.w600)),
        ),
      );
}

class _AvgCard extends StatelessWidget {
  final double avg;
  const _AvgCard({super.key, required this.avg});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: NegativeReviewsPage.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: NegativeReviewsPage.border, width: 1.1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          children: [
            Text(avg.toStringAsFixed(1),
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: NegativeReviewsPage.textMain)),
            const SizedBox(height: 6),
            const _Stars(rating: 4.0, size: 18),
          ],
        ),
      );
}

class _ReviewCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const _ReviewCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: NegativeReviewsPage.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: NegativeReviewsPage.border, width: 1.1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const CircleAvatar(radius: 18, backgroundColor: Color(0xFFEDE7E3), child: Icon(Icons.person, size: 18, color: Colors.black54)),
            const SizedBox(width: 10),
            Expanded(
              child: Text('${data['author']}', style: const TextStyle(fontWeight: FontWeight.w700, color: NegativeReviewsPage.textMain, fontSize: 15)),
            ),
            Text('${data['time']}', style: const TextStyle(color: NegativeReviewsPage.textSub, fontSize: 12.5)),
          ]),
          const SizedBox(height: 8),
          Row(children: [
            _Stars(rating: (data['rating'] as double), size: 16),
            const SizedBox(width: 6),
            Text((data['rating'] as double).toStringAsFixed(1),
                style: const TextStyle(color: NegativeReviewsPage.textSub, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 8),
          Text('${data['body']}', style: const TextStyle(color: NegativeReviewsPage.textMain, height: 1.35)),
        ]),
      );
}

class _Stars extends StatelessWidget {
  final double rating;
  final double size;
  const _Stars({super.key, required this.rating, this.size = 18});
  @override
  Widget build(BuildContext context) {
    int full = rating.floor();
    bool half = (rating - full) >= 0.5;
    return Row(mainAxisSize: MainAxisSize.min, children: List.generate(5, (i) {
      IconData icon;
      if (i < full) {
        icon = Icons.star_rounded;
      } else if (i == full && half) {
        icon = Icons.star_half_rounded;
      } else {
        icon = Icons.star_border_rounded;
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Icon(icon, size: size, color: const Color(0xFFFFC107)),
      );
    }));
  }
}
