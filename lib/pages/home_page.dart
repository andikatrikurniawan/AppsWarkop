import 'package:flutter/material.dart';
// import '../widget/enddrawer.dart';
import '../widget/profil_item.dart';
import '../widget/text_judul.dart';
import '../widget/image_item.dart';
import'../widget/grid_menu.dart';
import '../widget/appbar_warkop.dart';
// import '../widget/bottombar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppbarWarkop(title: "Warung Dayat", showBackButton: false),
      // endDrawer: const DrwerWidget(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
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
              GridMinuman(),
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
              GridMakanan(),
            ],
          ),
        ),
      ),
    );
  }
}