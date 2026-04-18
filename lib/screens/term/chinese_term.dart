import 'package:aba_bank_clone/open/phone_chinese.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChineseTermScreen extends StatefulWidget {
  const ChineseTermScreen({super.key});

  @override
  State<ChineseTermScreen> createState() => _ChineseTermScreenState();
}

class _ChineseTermScreenState extends State<ChineseTermScreen> {
  // Track which radio buttons are checked (3 options)
  final List<bool> _isChecked = [false, false, false];

  // Check if ALL radio buttons are checked
  bool get _allChecked => _isChecked.every((checked) => checked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0d2836),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a4a5e),
              Color(0xFF0d2836),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.only(left: 1.0, top: 0.0, bottom: 0.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        'assets/aba_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // Title
                      Text(
                        '使用条款\nABA Mobile',
                        style: GoogleFonts.dangrek(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w200,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Description paragraphs
                      Text(
                        '请在激活 ABA Mobile 应用程序之前仔细阅读以下条款。',
                        style: GoogleFonts.dangrek(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '点击"同意"即表示您确认同意遵守 ABA Mobile 应用程序的条款。',
                        style: GoogleFonts.dangrek(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        '如果您不同意这些条款，请不要继续操作或删除 ABA Mobile 应用程序。',
                        style: GoogleFonts.dangrek(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 260),

                      // Radio button options
                      _buildRadioButton(
                        index: 0,
                        text: '我已有账户，ABA Mobile 条款',
                        isLink: true,
                      ),

                      const SizedBox(height: 12),

                      _buildRadioButton(
                        index: 1,
                        text: '我已有账户，ABA 银行服务使用条款',
                        isLink: true,
                      ),

                      const SizedBox(height: 12),

                      _buildRadioButton(
                        index: 2,
                        text: '我同意以上所有条款',
                        isLink: false,
                      ),

                      const SizedBox(height: 20),

                      // Agree button - RED when all checked, GRAY when not
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _allChecked
                              ? () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) =>
                                          const PhoneChineseScreen(),
                                      transitionsBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeInOutCubic;

                                        var tween = Tween(
                                          begin: begin,
                                          end: end,
                                        ).chain(CurveTween(curve: curve));

                                        var offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          ),
                                        );
                                      },
                                      transitionDuration: const Duration(
                                        milliseconds: 400,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _allChecked
                                ? const Color(0xFFE53935) // RED when enabled
                                : Colors.grey.withOpacity(0.3), // GRAY when disabled
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            '同意',
                            style: GoogleFonts.dangrek(
                              color: _allChecked
                                  ? Colors.white
                                  : Colors.white54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButton({
    required int index,
    required String text,
    required bool isLink,
  }) {
    return GestureDetector(
      onTap: () {
        // Toggle the checkbox state
        setState(() {
          _isChecked[index] = !_isChecked[index];
        });
      },
      child: Row(
        children: [
          // Custom Radio Circle
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isChecked[index]
                    ? const Color(0xFFE53935) // Red border when checked
                    : Colors.white54, // Gray border when unchecked
                width: 2,
              ),
              color: _isChecked[index]
                  ? const Color(0xFFE53935) // Red fill when checked
                  : Colors.transparent, // No fill when unchecked
            ),
            child: _isChecked[index]
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.dangrek(
                  color: Colors.white,
                  fontSize: 13,
                ),
                children: isLink
                    ? _buildTextWithLink(text)
                    : [TextSpan(text: text)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildTextWithLink(String text) {
    if (text.contains('ABA Mobile')) {
      final parts = text.split('ABA Mobile');
      return [
        TextSpan(text: parts[0]),
        TextSpan(
          text: 'ABA Mobile',
          style: const TextStyle(
            color: Color(0xFF00B4D8),
            decoration: TextDecoration.underline,
          ),
        ),
        if (parts.length > 1) TextSpan(text: parts[1]),
      ];
    } else if (text.contains('ABA')) {
      final parts = text.split('ABA');
      return [
        TextSpan(text: parts[0]),
        const TextSpan(
          text: 'ABA',
          style: TextStyle(
            color: Color(0xFF00B4D8),
            decoration: TextDecoration.underline,
          ),
        ),
        if (parts.length > 1) TextSpan(text: parts[1]),
      ];
    }
    return [TextSpan(text: text)];
  }
}