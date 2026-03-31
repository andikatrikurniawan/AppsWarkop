import 'package:flutter/material.dart';
import '../models/model_menu.dart';
import '../widget/appbar_warkop.dart';

class PaymentPage extends StatelessWidget {
  final MenuModel menu;
  final int qty;
  final int total;

  const PaymentPage({
    super.key,
    required this.menu,
    required this.qty,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWarkop(title: "Pembayaran"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(menu.name),
            Text("Jumlah: $qty"),
            Text("Total: Rp $total"),

            const SizedBox(height: 20),

            ListTile(
              title: const Text("Cash"),
              onTap: () => success(context),
            ),
            ListTile(
              title: const Text("QRIS"),
              onTap: () => success(context),
            ),
          ],
        ),
      ),
    );
  }

  void success(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Sukses"),
        content: const Text("Pesanan berhasil!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}