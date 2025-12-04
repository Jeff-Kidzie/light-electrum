import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lightweight_electrum/data/promotion.dart';

class GetPromotionsUseCase {
  Future<List<Promotion>> execute() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/promotions.json',
      );
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> promotionsJson = data['promotions'] as List<dynamic>;

      return promotionsJson
          .map((json) => Promotion.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load promotions: $e');
    }
  }
}
