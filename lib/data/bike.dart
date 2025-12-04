class Bike {
  final String id;
  final String name;
  final String model;
  final String imageUrl;
  final String range;
  final int pricePerHour;
  final String priceText;
  final String status;
  final int batteryLevel;
  final BikeLocation location;

  Bike({
    required this.id,
    required this.name,
    required this.model,
    required this.imageUrl,
    required this.range,
    required this.pricePerHour,
    required this.priceText,
    required this.status,
    required this.batteryLevel,
    required this.location,
  });

  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
      id: json['id'] as String,
      name: json['name'] as String,
      model: json['model'] as String,
      imageUrl: json['imageUrl'] as String,
      range: json['range'] as String,
      pricePerHour: json['pricePerHour'] as int,
      priceText: json['priceText'] as String,
      status: json['status'] as String,
      batteryLevel: json['batteryLevel'] as int,
      location: BikeLocation.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'imageUrl': imageUrl,
      'range': range,
      'pricePerHour': pricePerHour,
      'priceText': priceText,
      'status': status,
      'batteryLevel': batteryLevel,
      'location': location.toJson(),
    };
  }
}

class BikeLocation {
  final double latitude;
  final double longitude;
  final String address;

  BikeLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory BikeLocation.fromJson(Map<String, dynamic> json) {
    return BikeLocation(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude, 'address': address};
  }
}
