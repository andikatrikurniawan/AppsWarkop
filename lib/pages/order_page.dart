import 'package:flutter/material.dart';
import '../models/model_menu.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widget/appbar_warkop.dart';

class OrderPage extends StatefulWidget {
  final MenuModel menu;

  const OrderPage({super.key, required this.menu});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int qty = 1;

  void _increaseQty() {
    setState(() => qty++);
  }

  void _decreaseQty() {
    if (qty > 1) {
      setState(() => qty--);
    }
  }

  void _addToCart() {
    final cart = context.read<CartProvider>();

    for (int i = 0; i < qty; i++) {
      cart.addToCart(widget.menu);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.shopping_bag),
            SizedBox(width: 10),
            Text("${widget.menu.name} ditambahkan ke keranjang "),
          ],
        ),
        backgroundColor: Colors.grey[400],
        duration: const Duration(seconds: 5),
        padding : EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.menu.price * qty;

    return Scaffold(
      appBar: AppbarWarkop(
        title: widget.menu.name,
        showBackButton: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// IMAGE
              Hero(
                tag: widget.menu.name,
                child: Image.asset(widget.menu.image, height: 150),
              ),

              const SizedBox(height: 10),

              /// NAMA
              Text(
                widget.menu.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// HARGA TOTAL
              Text(
                "Rp $total",
                style: const TextStyle(color: Colors.orange),
              ),

              const SizedBox(height: 20),

              /// QTY CONTROL
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _decreaseQty,
                    icon: const Icon(Icons.remove),
                  ),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      "$qty",
                      key: ValueKey(qty),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),

                  IconButton(
                    onPressed: _increaseQty,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// BOTTOM BAR
      bottomNavigationBar: _buildBottomBar(total),
    );
  }

  Widget _buildBottomBar(int total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black12),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TOTAL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total"),
              Text(
                "Rp $total",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// BUTTON
          ElevatedButton(
            onPressed: _addToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("Tambah ke Keranjang"),
          ),
        ],
      ),
    );
  }
}