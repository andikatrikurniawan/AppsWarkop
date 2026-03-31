import 'package:apps_warkop/widget/menu_makanan.dart';
import 'package:flutter/material.dart';
import '../models/model_menu.dart';
import 'menu_minuman.dart';

class GridMinuman extends StatelessWidget {
  const GridMinuman({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuListMinuman.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // HP = 2 kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return MenuMinuman(menu: menuListMinuman[index]);
      },
    );
  }
}

class GridMakanan extends StatelessWidget {
  const GridMakanan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuListMakanan.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // HP = 2 kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return MenuMakanan(menu: menuListMakanan[index]);
      },
    );
  }
}