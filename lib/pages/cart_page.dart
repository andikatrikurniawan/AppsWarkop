import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../widget/appbar_warkop.dart';
import 'payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: const AppbarWarkop(
        title: "Keranjang 🛒",
        showBackButton: false,
      ),

      body: cart.items.isEmpty
          ? const Center(
              child: Text("Keranjang kosong 😢"),
            )
          : Column(
              children: [
                /// 🛒 LIST ITEM
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item.menu.image,
                            width: 50,
                          ),

                          title: Text(item.menu.name),

                          subtitle: Text(
                            "Rp ${item.menu.price}",
                            style: const TextStyle(color: Colors.orange),
                          ),

                          /// 🔥 QTY CONTROL
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () =>
                                    cart.decreaseQty(item),
                              ),

                              Text("${item.qty}"),

                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () =>
                                    cart.increaseQty(item),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// 💰 TOTAL + CHECKOUT
                _buildBottomBar(context, cart),
              ],
            ),
    );
  }

  Widget _buildBottomBar(BuildContext context, CartProvider cart) {
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
                "Rp ${cart.totalPrice}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// CHECKOUT BUTTON
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentPage(
                    items: cart.items,
                    total: cart.totalPrice,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}