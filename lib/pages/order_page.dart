import 'package:flutter/material.dart';
import '../models/model_menu.dart';
import '../widget/appbar_warkop.dart';
import '../ultils_page/page_transition.dart';
import 'payment_page.dart';

class OrderPage extends StatefulWidget {
  final MenuModel menu;

  const OrderPage({super.key, required this.menu});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final total = widget.menu.price * qty;

    return Scaffold(
      appBar: AppbarWarkop(title: widget.menu.name),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔥 HERO IMAGE
              Hero(
                tag: widget.menu.name,
                child: Image.asset(widget.menu.image, height: 150),
              ),
        
              const SizedBox(height: 10),
        
              Text(widget.menu.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        
              Text("Rp $total",
                  style: const TextStyle(color: Colors.orange)),
        
              const SizedBox(height: 20),
        
              /// 🔥 QTY ANIMATION
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (qty > 1) setState(() => qty--);
                    },
                    icon: const Icon(Icons.remove),
                  ),
        
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Text(
                      "$qty",
                      key: ValueKey(qty),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
        
                  IconButton(
                    onPressed: () => setState(() => qty++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              /// 🔥 BUTTON (STICKY)
            ],
          ),
        ),
      ),
      
          bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total",
                      style: TextStyle(fontSize: 16)),
                  Text("Rp.$total",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition.fadeSlide(
                      PaymentPage(
                        menu: widget.menu,
                        qty: qty,
                        total: total,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Bayar"),
              ),
            ],
          ),
        ),
    );
  }
}