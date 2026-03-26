import 'package:flutter/material.dart';
import '../widget/enddrawer.dart';
import '../widget/profil_item.dart';
import '../widget/text_judul.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(
          color: Colors.black, // warna icon menu
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
        title: Text("Warung Kopi",
              style: TextStyle(
                color: Colors.amber[400],
                fontSize: 20,
              ),
              ),
      ),
      // endDrawer ada di sebelah kanan app bar kalo drawer ada di kiri
      endDrawer: DrwerWidget(),

      body: SafeArea(
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              color: Colors.amber[400],
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 10, right:10 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //profil item
                    ProfileItem(),
                  SizedBox(width: 20),
                  //text judul  
                  TextJudul(screenWidth: screenWidth),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image : AssetImage("images/patung.png"),
                        width: 150,
                        height: 150,
                        ),
                        SizedBox(height: 100,),
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image : AssetImage("images/ole.png"),
                                width: 80,
                                height: 150,
                                fit: BoxFit.cover,
                                ),
                                Image(
                                image : AssetImage("images/paes.png"),
                                width: 80,
                                height: 150,
                                fit: BoxFit.cover,
                                ),
                            ],
                          ),
                    ],
                  ),
              ],
            ),
          ),
            ),
          ],
        ),
      ),
    );
  }
}