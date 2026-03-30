import 'package:flutter/material.dart';

class MenuModel {
  final String name;
  final String price;
  final String image;

  MenuModel({
    required this.name,
    required this.price,
    required this.image,
  });
}

List<MenuModel> menuList = [
  MenuModel(name: "Cappuccino", price: "Rp. 18K", image: "images/capucino.jpg"),
  MenuModel(name: "Latte", price: "Rp. 20K", image: "images/latte.jpg"),
  MenuModel(name: "Americano", price: "Rp. 17K", image: "images/americano.jpg"),
  MenuModel(name: "Es Kopi Susu", price: "Rp. 15K", image: "images/coffe_susu.jpg"),
  MenuModel(name: "Cappuccino", price: "Rp. 18K", image: "images/capucino.jpg"),
  MenuModel(name: "Latte", price: "Rp. 20K", image: "images/latte.jpg"),
  MenuModel(name: "Americano", price: "Rp. 17K", image: "images/americano.jpg"),
  MenuModel(name: "Es Kopi Susu", price: "Rp. 15K", image: "images/coffe_susu.jpg"),
  MenuModel(name: "Cappuccino", price: "Rp. 18K", image: "images/capucino.jpg"),
  MenuModel(name: "Latte", price: "Rp. 20K", image: "images/latte.jpg"),
  MenuModel(name: "Americano", price: "Rp. 17K", image: "images/americano.jpg"),
  MenuModel(name: "Es Kopi Susu", price: "Rp. 15K", image: "images/coffe_susu.jpg"),
  MenuModel(name: "Cappuccino", price: "Rp. 18K", image: "images/capucino.jpg"),
  MenuModel(name: "Latte", price: "Rp. 20K", image: "images/latte.jpg"),
  MenuModel(name: "Americano", price: "Rp. 17K", image: "images/americano.jpg"),
  MenuModel(name: "Es Kopi Susu", price: "Rp. 15K", image: "images/coffe_susu.jpg"),
];

class MenuCard extends StatelessWidget {
  final MenuModel menu;

  const MenuCard({super.key, required this.menu});

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
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                menu.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // TEXT
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  menu.price,
                  style: TextStyle(
                    color: Colors.orange.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Fitur belum tersedia")),
                    );
                  },
                  label: const Text("Order"),
                  icon: const Icon(Icons.shopping_cart_checkout, size: 16),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
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