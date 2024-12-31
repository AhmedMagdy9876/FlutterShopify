import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 40, horizontal: MediaQuery.of(context).size.width / 40),
        children: <Widget>[
          HeadingText(text: 'Our Products'),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: PageView(children: <Widget>[
              Image.network('https://picsum.photos/200/300?random=1'),
              Image.network('https://picsum.photos/200/300?random=2'),
            ]),
          ),
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                ShoppingItemCard(
                    title: 'Item 1',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg'),
                ShoppingItemCard(
                    title: 'Item 2',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/William-Adolphe_Bouguereau_%281825-1905%29_-_The_Seamstress_%281898%29.jpg/543px-William-Adolphe_Bouguereau_%281825-1905%29_-_The_Seamstress_%281898%29.jpg?20170702121930'),
              ],
            ),
          HeadingText(text: 'Hot Offers!'),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Image.network('https://picsum.photos/200/300?random=$index')),
                    Expanded(
                      flex: 1,
                      child: Center(child: Text('Offer $index'))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShoppingItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ShoppingItemCard(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/100),
        child: Column(
          spacing: MediaQuery.of(context).size.height / 80,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Image.network(imageUrl),
            ),
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

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
