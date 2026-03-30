import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.28,
      height: screenWidth * 0.28,
      child: Stack(
        children: [
          Image.asset(
            "images/umkm.png",
            width: double.infinity,
            height: double.infinity,
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Row(
          //     children: [
          //       Image.asset(
          //         "images/ole.png",
          //         width: screenWidth * 0.12,
          //         fit: BoxFit.cover,
          //       ),
          //       Image.asset(
          //         "images/paes.png",
          //         width: screenWidth * 0.12,
          //         fit: BoxFit.cover,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}