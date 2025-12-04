import 'package:lightweight_electrum/data/bike.dart';

class BikeDetail extends Bike {
  final String description;
  final String maxSpeed;
  final Pricing pricing;
  final Specifications specifications;
  final List<String> features;
  final List<Stat> stats;
  final double rating;
  final int totalRides;

  BikeDetail({
    required super.id,
    required super.name,
    required super.model,
    required super.imageUrl,
    required super.range,
    required super.pricePerHour,
    required super.priceText,
    required super.status,
    required super.batteryLevel,
    required super.location,
    required this.description,
    required this.maxSpeed,
    required this.pricing,
    required this.specifications,
    required this.features,
    required this.stats,
    required this.rating,
    required this.totalRides,
  });

  factory BikeDetail.fromJson(Map<String, dynamic> json) {
    final pricingJson = json['pricing'] as Map<String, dynamic>?;
    return BikeDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      model: json['model'] as String,
      imageUrl: json['imageUrl'] as String,
      range: json['range'] as String,
      pricePerHour: pricingJson?['perHour'] as int? ?? 0,
      priceText: pricingJson?['priceText'] as String? ?? '',
      status: json['status'] as String,
      batteryLevel: json['batteryLevel'] as int,
      location: BikeLocation(latitude: 0, longitude: 0, address: ''),
      description: json['description'] as String,
      maxSpeed: json['maxSpeed'] as String,
      pricing: Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      specifications: Specifications.fromJson(
        json['specifications'] as Map<String, dynamic>,
      ),
      features: (json['features'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      totalRides: json['totalRides'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final baseJson = super.toJson();
    return {
      ...baseJson,
      'description': description,
      'maxSpeed': maxSpeed,
      'pricing': pricing.toJson(),
      'specifications': specifications.toJson(),
      'features': features,
      'stats': stats.map((e) => e.toJson()).toList(),
      'rating': rating,
      'totalRides': totalRides,
    };
  }
}

class Pricing {
  final int perHour;
  final int perDay;
  final int perWeek;
  final String priceText;
  final String billingInfo;

  Pricing({
    required this.perHour,
    required this.perDay,
    required this.perWeek,
    required this.priceText,
    required this.billingInfo,
  });

  factory Pricing.fromJson(Map<String, dynamic> json) {
    return Pricing(
      perHour: json['perHour'] as int,
      perDay: json['perDay'] as int,
      perWeek: json['perWeek'] as int,
      priceText: json['priceText'] as String,
      billingInfo: json['billingInfo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'perHour': perHour,
      'perDay': perDay,
      'perWeek': perWeek,
      'priceText': priceText,
      'billingInfo': billingInfo,
    };
  }
}

class Specifications {
  final String motor;
  final String battery;
  final String maxSpeed;
  final String frameMaterial;
  final String weight;
  final String maxLoad;
  final String brakes;
  final String tires;

  Specifications({
    required this.motor,
    required this.battery,
    required this.maxSpeed,
    required this.frameMaterial,
    required this.weight,
    required this.maxLoad,
    required this.brakes,
    required this.tires,
  });

  factory Specifications.fromJson(Map<String, dynamic> json) {
    return Specifications(
      motor: json['motor'] as String,
      battery: json['battery'] as String,
      maxSpeed: json['maxSpeed'] as String,
      frameMaterial: json['frameMaterial'] as String,
      weight: json['weight'] as String,
      maxLoad: json['maxLoad'] as String,
      brakes: json['brakes'] as String,
      tires: json['tires'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'motor': motor,
      'battery': battery,
      'maxSpeed': maxSpeed,
      'frameMaterial': frameMaterial,
      'weight': weight,
      'maxLoad': maxLoad,
      'brakes': brakes,
      'tires': tires,
    };
  }
}

class Stat {
  final String label;
  final String value;

  Stat({required this.label, required this.value});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(label: json['label'] as String, value: json['value'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value};
  }
}
