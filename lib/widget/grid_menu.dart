import 'package:apps_warkop/widget/menu_makanan.dart';
import 'package:flutter/material.dart';
import '../models/model_menu.dart';
import 'menu_minuman.dart';
// import '../pages/order_page.dart';
// import '../ultils_page/page_transition.dart';


class GridMinuman extends StatefulWidget {
  final List<MenuModel> menuMinuman;

  const GridMinuman({
    super.key, required this.menuMinuman,
  });

  @override
  State<GridMinuman> createState() => _GridMinumanState();
}

class _GridMinumanState extends State<GridMinuman> {
  @override
  Widget build(BuildContext context) {
     if (widget.menuMinuman.isEmpty) {
      return Center(
        child: Text("Menu tidak ditemukan 😢"),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.menuMinuman.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // HP = 2 kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
         final menu = widget.menuMinuman[index];
         return MenuMinuman(menu: menu);
      },
    );
  }
}

class GridMakanan extends StatelessWidget {
  final List<MenuModel> menuMakanan;
  const GridMakanan({
    super.key,
    required this.menuMakanan,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuMakanan.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // HP = 2 kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final menu = menuMakanan[index];
         return MenuMakanan(menu: menu);
      },
    );
  }
}