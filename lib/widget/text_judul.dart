import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextJudul extends StatelessWidget {
  const TextJudul({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    bool isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText(
              'Hallo, Andika',
              textStyle: TextStyle(
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              speed: const Duration(milliseconds: 80),
            ),
          ],
        ),

        const SizedBox(height: 2),

        Text(
          'Ngopi santai yuk ☕',
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 36,
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Fitur belum tersedia")),
              );
            },
            icon: const Icon(Icons.account_balance_wallet, size: 16),
            label: const Text("Balance"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade500,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}