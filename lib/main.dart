import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/heading_text.dart';
import 'package:flutter_shopping_app/hot_offers_list_view.dart';
import 'package:flutter_shopping_app/products_grid_view.dart';
import 'package:flutter_shopping_app/products_page_view.dart';

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
      home: const MyHomePage(title: 'Shopify'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 40,
            horizontal: MediaQuery.of(context).size.width / 40),
        children: <Widget>[
          // Section heading
          HeadingText(text: 'Our Products'),
          // Products PageView
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ProductsPageView(),
          ),
          // Products GridView
          ProductsGridView(),
          // Section heading
          HeadingText(text: 'Hot Offers!'),
          // Hot Offers ListView
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: HotOffersListView(),
          ),
        ],
      ),
    );
  }
}
