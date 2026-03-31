import 'package:flutter/material.dart';

class AppbarWarkop extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppbarWarkop({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: Navigator.canPop(context),
      leading: Navigator.canPop(context)
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
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Fitur belum tersedia")),
            );
          },
          icon: const Icon(Icons.notifications_on_rounded, color: Colors.orange,),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}