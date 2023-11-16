import '../api/api_client.dart';
import '../../utils/app_constants.dart';

class GiftCardRepo {
  const GiftCardRepo(this._apiClient);

  final ApiClient _apiClient;

  Future<String> getGiftCards() async {
    return await _apiClient.loadAsset(AppConstants.DUMMY_DATA_FILE);
  }
}
