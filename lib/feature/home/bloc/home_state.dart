import 'package:lightweight_electrum/data/bike.dart';
import 'package:lightweight_electrum/data/promotion.dart';
import 'package:lightweight_electrum/data/rental_package.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeRefreshing extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Bike> bikes;
  final List<Promotion> promotions;
  final List<RentalPackage> rentalPackages;

  HomeLoaded({
    required this.bikes,
    required this.promotions,
    required this.rentalPackages,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

class HomeBikeSelected extends HomeState {
  final String bikeId;
  HomeBikeSelected({required this.bikeId});
}
