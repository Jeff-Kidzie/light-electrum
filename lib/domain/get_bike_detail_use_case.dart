import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lightweight_electrum/data/bike_detail.dart';

class GetBikeDetailUseCase {
  Future<BikeDetail?> execute(String bikeId) async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/bike_details.json',
      );
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> bikeDetailsJson =
          data['bike_details'] as List<dynamic>;

      final bikeDetailJson = bikeDetailsJson.firstWhere(
        (json) => json['id'] == bikeId,
        orElse: () => null,
      );

      if (bikeDetailJson == null) return null;

      return BikeDetail.fromJson(bikeDetailJson as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to load bike detail: $e');
    }
  }
}
