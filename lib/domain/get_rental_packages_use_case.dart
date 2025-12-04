import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lightweight_electrum/data/rental_package.dart';

class GetRentalPackagesUseCase {
  Future<List<RentalPackage>> execute() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/rental_packages.json',
      );
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> packagesJson =
          data['rental_packages'] as List<dynamic>;

      return packagesJson
          .map((json) => RentalPackage.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load rental packages: $e');
    }
  }
}
