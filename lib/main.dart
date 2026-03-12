import 'package:flutter/material.dart';
import './pages/home_page.dart';

void main (){
  runApp(AppsWarkop());
}

class AppsWarkop extends StatelessWidget {
  const AppsWarkop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}