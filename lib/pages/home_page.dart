import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
         iconTheme: IconThemeData(
          color: Colors.cyanAccent, // warna icon menu
        ),
        leading: Padding(
        padding: EdgeInsets.all(4),
        child: Image.asset(
                'images/logo_warkop.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
        ),
        title: Text("Warkop Sapu Jagat",
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 20,
              ),
              ),
      ),
      // endDrawer ada di sebelah kanan app bar kalo drawer ada di kiri
      endDrawer: Drawer(
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
                    ),
                     ListTile(
                      leading: Icon(Icons.arrow_left),
                      title: Text("Product"),
                      trailing: Icon(Icons.shopping_cart),
                    ),
                     ListTile(
                      leading: Icon(Icons.arrow_left),
                      title: Text("Penjualan"),
                      trailing: Icon(Icons.point_of_sale_sharp),
                    ),
                     ListTile(
                      leading: Icon(Icons.arrow_left),
                      title: Text("Toko"),
                      trailing: Icon(Icons.store),
                    ),
                     ListTile(
                      leading: Icon(Icons.arrow_left),
                      title: Text("Pembayaran"),
                      trailing: Icon(Icons.payment),
                    ),
                     ListTile(
                      leading: Icon(Icons.arrow_left),
                      title: Text("Barang"),
                      trailing: Icon(Icons.inventory_sharp),
                    ),
                     ListTile(
                      leading: Icon(Icons.arrow_left),
                      title: Text("Kategori"),
                      trailing: Icon(Icons.category),
                    ),
                  ],
                ),             
                ),
            ],
          ),
      ),
    );
  }
}