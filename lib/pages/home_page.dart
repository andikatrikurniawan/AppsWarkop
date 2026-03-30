import 'package:flutter/material.dart';
import '../widget/enddrawer.dart';
import '../widget/profil_item.dart';
import '../widget/text_judul.dart';
import '../widget/image_item.dart';
import'../widget/grid_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(
            'images/logo_warkop.png',
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Warung Kopi",
          style: TextStyle(
            color: Colors.orange.shade400,
          ),
        ),
      ),

      endDrawer: const DrwerWidget(),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              color: Colors.orange.shade300,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PROFILE
                    const ProfileItem(),
                    const SizedBox(width: 10),
                    // TEXT (biar tidak overflow)
                    Expanded(
                      child: TextJudul(screenWidth: screenWidth),
                    ),
                    const SizedBox(width: 10),
                    // IMAGE AREA
                    ImageItem(screenWidth: screenWidth),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            // JUDUL MENU COFFE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Menu Minum Favorit ☕",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // GRID MENU COFFER
            GridMenu(),
            SizedBox(height: 25),
            // JUDUL MENU COFFE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Menu Makan Favorit 🍽️",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // GRID MENU COFFER
            GridMenu(),
          ],
        ),
      ),
    );
  }
}