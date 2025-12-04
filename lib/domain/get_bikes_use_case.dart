import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lightweight_electrum/data/bike.dart';

class GetBikesUseCase {
  Future<List<Bike>> execute() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/bikes.json',
      );
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> bikesJson = data['bikes'] as List<dynamic>;

      return bikesJson
          .map((json) => Bike.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load bikes: $e');
    }
  }
}
