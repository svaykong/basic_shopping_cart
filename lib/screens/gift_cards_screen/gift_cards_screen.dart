import 'package:flutter/material.dart';

final List<Map<String, dynamic>> giftCards = [
  {
    "name": "Steam Card",
    "path": "assets/images/img_1.png",
  },
  {
    "name": "iTunes Card",
    "path": "assets/images/img_2.png",
  },
  {
    "name": "Gift Card",
    "path": "assets/images/img_3.png",
  },
  {
    "name": "Google Play Card",
    "path": "assets/images/img_4.png",
  },
  {
    "name": "Amazon Card",
    "path": "assets/images/img_5.png",
  },
  {
    "name": "Star Buck Card",
    "path": "assets/images/img_6.png",
  },
  {
    "name": "Star Buck Drink Card",
    "path": "assets/images/img_7.png",
  },
  {
    "name": "Roblox Card",
    "path": "assets/images/img_8.png",
  },
  {
    "name": "Walmart Card",
    "path": "assets/images/img_9.png",
  },
  {
    "name": "Digital Card",
    "path": "assets/images/img_10.png",
  },
];

class GiftCardsScreen extends StatelessWidget {
  const GiftCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Cards'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(8.0),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          crossAxisCount: 2,
          children: List.generate(giftCards.length, (index) {
            return GestureDetector(
              onTap: () {
                // bloc.addToCart(index);
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(giftCards[index]["path"]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
