import 'package:ecommerceapp/Auth/signup_page.dart';
import 'package:ecommerceapp/screens/fetures_page.dart';
import 'package:ecommerceapp/screens/filter_page.dart';
import 'package:ecommerceapp/screens/home_page.dart';
import 'package:ecommerceapp/screens/item_details.dart';
import 'package:ecommerceapp/screens/over_view_page.dart';
import 'package:ecommerceapp/screens/search_page.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';
import 'package:ecommerceapp/screens/specific_category_page.dart';
import 'package:ecommerceapp/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'Auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

