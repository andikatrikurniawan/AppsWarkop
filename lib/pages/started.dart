import'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../widget/bottombar.dart';

class Starded extends StatefulWidget {
  const Starded({super.key});

  @override
  State<Starded> createState() => _StardedState();
}

class _StardedState extends State<Starded> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height/1.8,
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: Image(image: AssetImage("images/umkm.png")),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  AnimatedTextKit(
                totalRepeatCount: TimeOfDay.hoursPerDay,
                animatedTexts: [
                  TyperAnimatedText(
                    'Selamat Datang Di Warung Dayat',
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    speed: const Duration(milliseconds: 80),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(padding: EdgeInsets.only(right: 100),
                child: Text("Nikmati Setiap Tegukan Rasakan Kebahagiaan dan ketenangan.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
        ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottombar()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade500,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),  
                ),
                child: Text("Get Started"),
              ),           
      ],
    ),
    ),
    );
  }
}