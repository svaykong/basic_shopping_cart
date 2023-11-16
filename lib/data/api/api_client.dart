import 'package:flutter/services.dart' show rootBundle;

import '../../utils/logger.dart';

class ApiClient {
  Future<String> loadAsset(String path) async {
    "loadAsset start".log();
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        "waiting 2 seconds".log();
      });
      return await rootBundle.loadString(path);
    } on Exception catch (e) {
      throw Exception("loadAsset Exception: $e");
    } finally {
      "loadAsset finally".log();
    }
  }
}
