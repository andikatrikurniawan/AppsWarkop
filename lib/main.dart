import 'package:flutter/material.dart';
import 'pages/started.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

void main (){
  runApp(AppsWarkop());
}

class AppsWarkop extends StatelessWidget {
  const AppsWarkop({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
       providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Starded(),
      ),
    );
  }
}