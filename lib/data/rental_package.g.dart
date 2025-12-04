// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentalPackage _$RentalPackageFromJson(Map<String, dynamic> json) =>
    RentalPackage(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      price: json['price'] as String,
      priceValue: (json['priceValue'] as num).toInt(),
      duration: json['duration'] as String,
      durationType: json['durationType'] as String,
      description: json['description'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isPopular: json['isPopular'] as bool,
      savings: (json['savings'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RentalPackageToJson(RentalPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'priceValue': instance.priceValue,
      'duration': instance.duration,
      'durationType': instance.durationType,
      'description': instance.description,
      'features': instance.features,
      'isPopular': instance.isPopular,
      'savings': instance.savings,
    };
