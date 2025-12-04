import 'package:lightweight_electrum/data/bike_detail.dart';

abstract class BikeDetailState {}

class BikeDetailInitial extends BikeDetailState {}

class BikeDetailLoading extends BikeDetailState {}

class BikeDetailLoaded extends BikeDetailState {
  final BikeDetail bikeDetail;

  BikeDetailLoaded(this.bikeDetail);
}

class BikeDetailError extends BikeDetailState {
  final String message;

  BikeDetailError(this.message);
}
