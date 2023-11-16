import 'package:flutter/material.dart';

import '../../utils/logger.dart';
import '../../data/api/api_client.dart';
import '../../data/models/gift_card_model.dart';
import '../../data/repository/gift_card_repo.dart';
import '../../services/gift_cards_service.dart';

class GiftCardsScreen extends StatefulWidget {
  const GiftCardsScreen({super.key});

  @override
  State<GiftCardsScreen> createState() => _GiftCardsScreenState();
}

class _GiftCardsScreenState extends State<GiftCardsScreen> {
  late final GiftCardsService _giftCardsService;
  late final Future<List<GiftCard>> _giftCardsFuture;

  @override
  void initState() {
    super.initState();
    GiftCardRepo giftCardRepo = GiftCardRepo(ApiClient());
    _giftCardsService = GiftCardsService(giftCardRepo);
    _giftCardsFuture = _giftCardsService.getGiftCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Gift Cards'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: _giftCardsFuture,
            builder: (context, AsyncSnapshot<List<GiftCard>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    'Error: ${snapshot.error}'.log();
                    return const Text("Sorry, there was an error occurred.");
                  }
                  var results = snapshot.data;
                  if (results == null) {
                    return const Text("Sorry, there are no gift cards now.");
                  }
                  return buildListGiftCards(results);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildListGiftCards(List<GiftCard> giftCards) {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      crossAxisCount: 2,
      children: List.generate(giftCards.length, (index) {
        return GestureDetector(
          onTap: () {},
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(giftCards[index].path),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
      }),
    );
  }
}
