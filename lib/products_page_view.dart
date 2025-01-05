import 'package:flutter/material.dart';

class ProductsPageView extends StatelessWidget {
  const ProductsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // PageView height
      height: MediaQuery.of(context).size.height / 2,
      // PageView with images
      child: PageView(children: <Widget>[
        Image.network(
          'https://picsum.photos/200/300?random=1',
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              Container(child: child),
        ),
        Image.network(
          'https://picsum.photos/200/300?random=2',
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              Container(child: child),
        ),
      ]),
    );
  }
}
