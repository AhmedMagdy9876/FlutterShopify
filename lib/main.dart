import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/heading_text.dart';
import 'package:flutter_shopping_app/home_page.dart';
import 'package:flutter_shopping_app/hot_offers_list_view.dart';
import 'package:flutter_shopping_app/products_grid_view.dart';
import 'package:flutter_shopping_app/products_page_view.dart';
import 'sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpPage(),
    );
  }
}
