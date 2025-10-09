import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String userName;
  final String userImage;

  // 💡 إضافة 'const' للمُنشئ لتحسين الأداء
  const ChatDetailPage({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    // 💡 الوصول إلى ColorScheme لسهولة استخدام الألوان
    final colorScheme = Theme.of(context).colorScheme;
    final textOnBackground = colorScheme.onBackground;

    return Scaffold(
      // 💡 سيأخذ لون الخلفية من Theme.of(context).colorScheme.background
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        // 💡 سيستخدم ألوان AppBar المعرفة في main.dart (Primary و onPrimary)
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        toolbarHeight: 100,

        title: Row(
          children: [
            // صورة المستخدم
            ClipOval(
              child: Image.asset(
                widget.userImage,
                width: 46,
                height: 46,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // اسم المستخدم
            Text(
              widget.userName,
              // 💡 لون النص يتغير مع الثيم
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(
                  context,
                ).appBarTheme.foregroundColor, // لون النص في شريط التطبيق
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // الرسائل
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  // لنفترض أن جميع الرسائل هي رسائل واردة (للتوضيح)
                  // يمكنك إضافة منطق isMe/isOther لتحديد الاتجاه واللون

                  // 💡 تعريف لون فقاعة الرسالة ولون النص داخلها
                  final messageColor = colorScheme.primary; // لون الفقاعة
                  final messageTextColor = colorScheme
                      .onPrimary; // لون النص داخل الفقاعة (يجب أن يكون أبيض عادةً)

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // صورة المرسل
                      ClipOval(
                        child: Image.asset(
                          widget.userImage,
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // فقاعة الرسالة
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            // 💡 استخدام لون الثيم الأساسي (primary) للفقاعة
                            color: messageColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          ),
                          child: Text(
                            _messages[index],
                            // 💡 لون النص داخل الفقاعة
                            style: TextStyle(color: messageTextColor),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // خانة الإدخال
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(
                        color: textOnBackground,
                      ), // لون النص المُدخل
                      decoration: InputDecoration(
                        hintText: 'Type your message',
                        hintStyle: TextStyle(
                          color: textOnBackground.withOpacity(0.5),
                        ), // لون النص المساعد
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 10,
                        ),
                        filled: true,
                        // 💡 لون خلفية خانة الإدخال يتوافق مع الثيم (لون surface أو background)
                        fillColor: colorScheme.surface,

                        // 💡 إزالة الحدود الثابتة واستبدالها بالثيم
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(27.5),
                          borderSide: BorderSide(color: colorScheme.surface),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(27.5),
                          borderSide: BorderSide(color: colorScheme.surface),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(27.5),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 2,
                          ), // التركيز بلون الثيم الأساسي
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    // 💡 لون زر الإرسال بلون الثيم الأساسي
                    icon: Icon(Icons.send, color: colorScheme.primary),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add(_controller.text.trim());
      _controller.clear();
    });
  }
}
