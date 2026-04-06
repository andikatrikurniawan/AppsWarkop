import '../pages/started.dart';
import 'package:flutter/material.dart';

class AppbarWarkop extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const AppbarWarkop({super.key, required this.title, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: Navigator.canPop(context),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            )
          : Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset('images/logo_warkop.png'),
            ),
      title: Text(
        title,
        style: TextStyle(color: Colors.orange.shade400),
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.notifications_active, color: Colors.orange),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Fitur belum tersedia")),
              );
            },
          ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context, 
              builder: (context) {
                return AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Apakah Anda yakin ingin logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Starded()),
                          (route) => false,
                        );
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                );
              },
              );
          },
          icon: const Icon(Icons.logout_outlined, color: Colors.orange,),
        )

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}