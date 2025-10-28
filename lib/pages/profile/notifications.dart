import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  // ألوان
  static const bg = Color(0xFFFAF1ED);
  static const card = Colors.white;
  static const border = Color(0xFFE3DCD7);
  static const textMain = Color(0xFF1F1F1F);
  static const textSub  = Color(0xFF8A8A8A);
  static const double maxW = 430;

  // ✅ بيانات نصّية مختصرة (غيّر النصوص فقط لاحقًا أو استبدلها من API)
  final List<Map<String, String>> _today = List.generate(
    4,
    (_) => {
      'bold': 'You',
      'msg' : ' purchased UX Research',
      'time': '7 minutes ago',
    },
  );

  final List<Map<String, String>> _yesterday = const [
    {'bold': 'You', 'msg': ' purchased UX Research', 'time': '1 day ago'},
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);

    return MediaQuery(
      data: media,
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
                    Text('Notification', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textMain)),
                  ]),
                  const SizedBox(height: 16),

                  if (_today.isNotEmpty) ...[
                    const _SectionTitle('Today'), const SizedBox(height: 12),
                    for (final m in _today)
                      NotifCard(bold: m['bold']!, msg: m['msg']!, time: m['time']!),
                    const SizedBox(height: 24),
                  ],

                  if (_yesterday.isNotEmpty) ...[
                    const _SectionTitle('Yesterday'), const SizedBox(height: 12),
                    for (final m in _yesterday)
                      NotifCard(bold: m['bold']!, msg: m['msg']!, time: m['time']!),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 🔹 كارد واحدة فقط – يُعاد استخدامها باللوب
class NotifCard extends StatelessWidget {
  final String bold, msg, time;
  const NotifCard({super.key, required this.bold, required this.msg, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: NotificationPage.card,
        border: Border.all(color: NotificationPage.border, width: 1.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(radius: 22, backgroundColor: Color(0xFFEDE7E3), child: Icon(Icons.person, color: Colors.black54)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: bold, style: const TextStyle(fontWeight: FontWeight.w800, color: NotificationPage.textMain, fontSize: 15.5)),
                  TextSpan(text: msg,  style: const TextStyle(fontWeight: FontWeight.w500, color: NotificationPage.textMain, fontSize: 15.5)),
                ]),
              ),
              const SizedBox(height: 6),
              Text(time, style: const TextStyle(fontSize: 13, color: NotificationPage.textSub)),
            ]),
          ),
        ],
      ),
    );
  }
}

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

class _SectionTitle extends StatelessWidget {
  final String t; const _SectionTitle(this.t, {super.key});
  @override
  Widget build(BuildContext context) =>
      Text(t, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: NotificationPage.textMain));
}
