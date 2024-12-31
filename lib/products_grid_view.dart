import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/shopping_item_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Number of columns
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        // Product items
        ShoppingItemCard(
          title: 'Item 1',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg',
        ),
        ShoppingItemCard(
          title: 'Item 2',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/William-Adolphe_Bouguereau_%281825-1905%29_-_The_Seamstress_%281898%29.jpg/543px-William-Adolphe_Bouguereau_%281825-1905%29_-_The_Seamstress_%281898%29.jpg?20170702121930',
        ),
      ],
    );
  }
}
