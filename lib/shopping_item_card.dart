import 'package:flutter/material.dart';

class ShoppingItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ShoppingItemCard(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card padding
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 100),
        child: Column(
          // Spacing between elements
          spacing: MediaQuery.of(context).size.height / 80,
          children: <Widget>[
            // Item title
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // Item image
            Expanded(
              child: Image.network(
                imageUrl,
                loadingBuilder: (context, child, loadingProgress) =>
                    Container(child: child),
              ),
            ),
            // Add to cart button
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item added to cart')));
                },
                icon: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}
