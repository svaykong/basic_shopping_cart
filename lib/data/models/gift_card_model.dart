import 'package:equatable/equatable.dart';

class GiftCardModel extends Equatable {
  const GiftCardModel({
    required this.giftCards,
  });

  final List<GiftCard> giftCards;

  @override
  List<Object?> get props => [giftCards];

  factory GiftCardModel.fromJson(Map<String, dynamic> json) {
    var lists = List.from(json["gift_cards"]);
    return GiftCardModel(
      giftCards: lists.map((element) => GiftCard.fromJson(element)).toList(),
    );
  }
}

class GiftCard extends Equatable {
  const GiftCard({
    required this.id,
    required this.name,
    required this.path,
  });

  final int? id;
  final String name;
  final String path;

  @override
  List<Object?> get props => [name, path];

  factory GiftCard.fromJson(Map<String, dynamic> json) {
    return GiftCard(
      id: int.tryParse(json["id"]),
      name: json["name"],
      path: json["path"],
    );
  }
}
