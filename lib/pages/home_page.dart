import 'package:flutter/material.dart';
// import '../widget/enddrawer.dart';
import '../widget/profil_item.dart';
import '../widget/text_judul.dart';
import '../widget/image_item.dart';
import'../widget/grid_menu.dart';
import '../models/model_menu.dart';
import '../widget/appbar_warkop.dart';
// import '../widget/bottombar.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Timer? debounce;

  @override
void dispose() {
  debounce?.cancel();
  super.dispose();
}
  List<MenuModel> filteredMinuman = [];
  List<MenuModel> filteredMakanan = [];

@override
void initState() {
  super.initState();
  filteredMinuman = menuMinuman;
  filteredMakanan = menuMakanan;
}

// 🔍 FUNCTION FILTER
void filterMenu(String keyword) {
  final input = keyword.toLowerCase();

  setState(() {
    filteredMinuman = menuMinuman.where((menu) {
      return menu.name.toLowerCase().contains(input);
    }).toList();

    filteredMakanan = menuMakanan.where((menu) {
      return menu.name.toLowerCase().contains(input);
    }).toList();
  });
}
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
              SizedBox(height : 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                        BoxShadow(
                          color: Colors.amber,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                      
                  ),
                  child: TextField(
                   onChanged: (value) {
                        if (debounce?.isActive ?? false) debounce!.cancel();

                        debounce = Timer(const Duration(milliseconds: 300), () {
                          filterMenu(value);
                        });
                      },
                    decoration: InputDecoration(
                      hintText: "Cari Menu Pesanan",
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              // JUDUL MENU COFFE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // MINUMAN (TAMPIL HANYA JIKA ADA)
                  if (filteredMinuman.isNotEmpty) ...[
                    const Text(
                      "Menu Minum Favorit ☕",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    GridMinuman(menuMinuman: filteredMinuman),
                    const SizedBox(height: 20),
                  ],

                  // MAKANAN (TAMPIL HANYA JIKA ADA)
                  if (filteredMakanan.isNotEmpty) ...[
                    const Text(
                      "Menu Makan Favorit 🍽️",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                   GridMakanan(menuMakanan: filteredMakanan),
                  ],

                  // KALAU SEMUA KOSONG
                  if (filteredMinuman.isEmpty && filteredMakanan.isEmpty)
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Icon(Icons.search_off, size: 60, color: Colors.grey),
                          SizedBox(height: 10),
                          Text("Menu tidak ditemukan 😢"),
                        ],
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}