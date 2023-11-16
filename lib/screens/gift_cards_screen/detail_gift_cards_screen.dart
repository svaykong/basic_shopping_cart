import 'package:flutter/material.dart';

import '../../data/models/gift_card_model.dart';

class DetailGiftCardsScreen extends StatelessWidget {
  const DetailGiftCardsScreen({Key? key, required this.giftCards}) : super(key: key);

  final GiftCard giftCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(giftCards.name),
      ),
    );
  }
}
