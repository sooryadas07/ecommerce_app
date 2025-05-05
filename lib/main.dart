import 'package:ecommerce_app/cart_page.dart';
import 'package:ecommerce_app/custom_navigation_bar.dart';
import 'package:ecommerce_app/home_page.dart';
import 'package:ecommerce_app/login_page.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Louis Vuitton ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CustomNavigationBar(),
    );
  }
}
