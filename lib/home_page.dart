import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/heading_text.dart';
import 'package:flutter_shopping_app/hot_offers_list_view.dart';
import 'package:flutter_shopping_app/products_grid_view.dart';
import 'package:flutter_shopping_app/products_page_view.dart';

class HomePage extends StatelessWidget {
  static const title = 'Shopify';

  const HomePage({super.key});

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
