// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion(
  id: json['id'] as String,
  label: json['label'] as String,
  labelColor: json['labelColor'] as String,
  chipColor: json['chipColor'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  buttonText: json['buttonText'] as String,
  discountText: json['discountText'] as String?,
  priceText: json['priceText'] as String,
  isActive: json['isActive'] as bool,
  validUntil: json['validUntil'] as String,
);

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'labelColor': instance.labelColor,
  'chipColor': instance.chipColor,
  'title': instance.title,
  'description': instance.description,
  'buttonText': instance.buttonText,
  'discountText': instance.discountText,
  'priceText': instance.priceText,
  'isActive': instance.isActive,
  'validUntil': instance.validUntil,
};
