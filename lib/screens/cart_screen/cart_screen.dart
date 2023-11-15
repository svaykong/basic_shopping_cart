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

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
            itemCount: giftCards.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                onTap: () {},
                leading: Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(giftCards[index]["path"]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                title: Text(giftCards[index]["name"]),
                trailing: MaterialButton(
                  color: Colors.blueGrey[600],
                  elevation: 12.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    // bloc.clear(giftIndex);
                  },
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
