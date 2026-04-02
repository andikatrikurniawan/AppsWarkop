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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Starded(),
              ),
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