import 'package:apps_warkop/pages/scan_page.dart';
import '../widget/bottombar.dart';
import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../widget/appbar_warkop.dart';

class PaymentPage extends StatelessWidget {
  final List<CartModel> items;
  final int total;

  const PaymentPage({
    super.key,
    required this.items,
    required this.total,
  });

  void _showSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Sukses"),
        content: const Text("Pesanan berhasil!"),
        actions: [
          TextButton(
            onPressed: () {
             Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => Bottombar()),
             (route) => true,
              );
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWarkop(
        title: "Pembayaran",
        showBackButton: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// LIST ITEM
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return ListTile(
                    title: Text(item.menu.name),
                    subtitle: Text("x${item.qty}"),
                    trailing: Text("Rp ${item.totalPrice}"),
                  );
                }).toList(),
              ),
            ),

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

            const SizedBox(height: 20),

            /// METODE PEMBAYARAN
            ListTile(
              leading: const Icon(Icons.payments),
              title: const Text("Cash"),
              onTap: () => _showSuccess(context),
            ),

            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text("QRIS"),
              onTap: () {
                 Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ScanPage()),
                  (route) => true,
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}