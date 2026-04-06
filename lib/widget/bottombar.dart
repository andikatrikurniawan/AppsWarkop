import 'package:apps_warkop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../pages/cart_page.dart';
import '../pages/scan_page.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
   int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    CartPage(),
    Center(child: Text("Profile Page")),
    Center(child: Text("Settings Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanPage(),
          ),
         );
        },
        backgroundColor: Colors.orangeAccent[400],
        child: Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home, 
          Icons.shopping_cart, 
          Icons.person, 
          Icons.settings],
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        backgroundGradient: LinearGradient(colors: [
          Colors.orange.shade400, 
          Colors.orange.shade200
          ],
          ),
        activeColor: Colors.pinkAccent,
        inactiveColor: Colors.white,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        iconSize: 24,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}