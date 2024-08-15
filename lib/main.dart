import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_comerce/models/shop.dart';
import 'package:app_comerce/pages/intro_page.dart';
import 'package:app_comerce/pages/shop_page.dart';
import 'package:app_comerce/pages/cart_page.dart'; // Ensure this import is correct
import 'package:app_comerce/themes/light_mode.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}