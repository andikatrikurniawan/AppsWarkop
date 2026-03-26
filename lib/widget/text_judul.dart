import 'package:flutter/material.dart';

class TextJudul extends StatelessWidget {
  const TextJudul({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
      Text("Hallo Andika",
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: screenWidth < 600 ? 18 : 20,
        fontFamily: "Times New Roman",
        fontWeight: FontWeight.bold,
       ),
      ),
      Text("Selamat Datang Di Warung Kopi",
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontSize: screenWidth < 600 ? 12 : 14,
        fontFamily: "Times New Roman",
        fontWeight: FontWeight.bold,
       ),
      ),
      SizedBox(height: 30),
      ElevatedButton.icon(
        onPressed: () {
    
        },
        label: Text("Order", style: TextStyle(
        fontSize: 14,
        fontFamily: "Times New Roman",
        fontWeight: FontWeight.bold,
        ),
        ),
        icon: Icon(Icons.shopping_cart_checkout),
      ),
     ],
    );
  }
}