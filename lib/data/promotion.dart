import 'package:json_annotation/json_annotation.dart';

part 'promotion.g.dart';

@JsonSerializable()
class Promotion {
  final String id;
  final String label;
  final String labelColor;
  final String chipColor;
  final String title;
  final String description;
  final String buttonText;
  final String? discountText;
  final String priceText;
  final bool isActive;
  final String validUntil;

  Promotion({
    required this.id,
    required this.label,
    required this.labelColor,
    required this.chipColor,
    required this.title,
    required this.description,
    required this.buttonText,
    this.discountText,
    required this.priceText,
    required this.isActive,
    required this.validUntil,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionToJson(this);
}
