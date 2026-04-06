import 'package:flutter/material.dart';
import '../models/model_menu.dart';
import '../pages/order_page.dart';
import '../ultils_page/page_transition.dart';

class MenuMakanan extends StatelessWidget {
  final MenuModel menu;

  const MenuMakanan({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.amber.shade300,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius:BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                menu.image,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // TEXT
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Rp.${menu.price}",
                  style: TextStyle(
                    color: Colors.orange.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton.icon(
                  onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition.fadeSlide(
                            OrderPage(menu: menu),
                          ),
                        );
                      },
                  label: Text("Order"),
                  icon: Icon(Icons.shopping_cart_checkout, size: 16),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}