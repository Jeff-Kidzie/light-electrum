import 'package:json_annotation/json_annotation.dart';

part 'rental_package.g.dart';

@JsonSerializable()
class RentalPackage {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final int priceValue;
  final String duration;
  final String durationType;
  final String description;
  final List<String> features;
  final bool isPopular;
  final int? savings;

  RentalPackage({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.priceValue,
    required this.duration,
    required this.durationType,
    required this.description,
    required this.features,
    required this.isPopular,
    this.savings,
  });

  factory RentalPackage.fromJson(Map<String, dynamic> json) =>
      _$RentalPackageFromJson(json);

  Map<String, dynamic> toJson() => _$RentalPackageToJson(this);
}
