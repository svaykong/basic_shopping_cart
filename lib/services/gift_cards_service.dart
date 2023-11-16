import 'dart:convert' as json;

import '../../data/repository/gift_card_repo.dart';
import '../data/models/gift_card_model.dart';
import '../utils/logger.dart';

class GiftCardsService {
  const GiftCardsService(this._giftCardRepo);

  final GiftCardRepo _giftCardRepo;

  Future<List<GiftCard>> getGiftCards() async {
    "getGiftCards start".log();
    try {
      // delayed 300 milliseconds
      await Future.delayed(const Duration(milliseconds: 300), () {});
      final resultStr = await _giftCardRepo.getGiftCards();
      final resultJson = json.jsonDecode(resultStr);
      final giftCardModel = GiftCardModel.fromJson(resultJson);
      return giftCardModel.giftCards;
    } on Exception catch (e) {
      throw Exception("giftCards Exception: $e");
    } finally {
      "getGiftCards finally".log();
    }
  }
}
