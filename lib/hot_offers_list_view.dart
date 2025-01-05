import 'package:flutter/material.dart';

class HotOffersListView extends StatelessWidget {
  const HotOffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: <Widget>[
            // Offer image
            Expanded(
              flex: 3,
              child: Image.network(
                'https://picsum.photos/200/300?random=$index',
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                    Container(child: child),
              ),
            ),
            // Offer title
            Expanded(flex: 1, child: Center(child: Text('Offer $index'))),
          ],
        ),
      ),
    );
  }
}
