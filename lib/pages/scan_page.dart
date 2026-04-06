import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../widget/appbar_warkop.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWarkop(
        title: "Scan QR / Barcode",
        showBackButton: true,
      ),
      body: MobileScanner(
                onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                for (final barcode in barcodes) {
                  final String? code = barcode.rawValue;

                  if (code != null) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Hasil Scan"),
                  content: Text(code),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK"),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}