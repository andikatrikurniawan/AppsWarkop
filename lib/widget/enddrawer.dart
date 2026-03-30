import 'package:flutter/material.dart';

class DrwerWidget extends StatelessWidget {
  const DrwerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 100,
              color : Colors.deepPurple,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                  "Menu Dashbord",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20
                    ),
                ),
                Spacer(),
                Icon(Icons.dashboard_customize,
                size: 20,
                ),
                ],
              ),
            ),
            //Expanded memenuhi ukuran seluruhnya
            Expanded(
              child: ListView(
                padding:EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Home"),
                    trailing: Icon(Icons.home),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                   ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Product"),
                    trailing: Icon(Icons.shopping_cart),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                   ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Penjualan"),
                    trailing: Icon(Icons.point_of_sale_sharp),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                   ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Toko"),
                    trailing: Icon(Icons.store),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                   ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Pembayaran"),
                    trailing: Icon(Icons.payment),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                   ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Barang"),
                    trailing: Icon(Icons.inventory_sharp),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                   ListTile(
                    leading: Icon(Icons.arrow_left),
                    title: Text("Kategori"),
                    trailing: Icon(Icons.category),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fitur belum tersedia")),
                      );
                    },
                  ),
                ],
              ),             
              ),
          ],
        ),
    );
  }
}