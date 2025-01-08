import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/heading_text.dart';
import 'package:flutter_shopping_app/hot_offers_list_view.dart';
import 'package:flutter_shopping_app/locale_dropdown.dart';
import 'package:flutter_shopping_app/products_grid_view.dart';
import 'package:flutter_shopping_app/products_page_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  final Function(String? value)? localeChangeCallback;
  const HomePage({super.key, this.localeChangeCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          LocaleDropdown(callback: localeChangeCallback),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 40,
            horizontal: MediaQuery.of(context).size.width / 40),
        children: <Widget>[
          // Section heading
          HeadingText(
              text: AppLocalizations.of(context)!.ourProductsSectionTitle),
          // Products PageView
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ProductsPageView(),
          ),
          // Products GridView
          ProductsGridView(),
          // Section heading
          HeadingText(
              text: AppLocalizations.of(context)!.hotOffersSectionTitle),
          // Hot Offers ListView
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: HotOffersListView(),
          ),
        ],
      ),
    );
  }
}
