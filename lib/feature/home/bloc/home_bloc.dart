import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:lightweight_electrum/domain/get_bikes_use_case.dart';
import 'package:lightweight_electrum/domain/get_promotions_use_case.dart';
import 'package:lightweight_electrum/domain/get_rental_packages_use_case.dart';
import 'package:lightweight_electrum/feature/home/bloc/home_event.dart';
import 'package:lightweight_electrum/feature/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBikesUseCase _getBikesUseCase;
  final GetPromotionsUseCase _getPromotionsUseCase;
  final GetRentalPackagesUseCase _getRentalPackagesUseCase;

  HomeBloc({
    GetBikesUseCase? getBikesUseCase,
    GetPromotionsUseCase? getPromotionsUseCase,
    GetRentalPackagesUseCase? getRentalPackagesUseCase,
  }) : _getBikesUseCase = getBikesUseCase ?? GetBikesUseCase(),
       _getPromotionsUseCase = getPromotionsUseCase ?? GetPromotionsUseCase(),
       _getRentalPackagesUseCase =
           getRentalPackagesUseCase ?? GetRentalPackagesUseCase(),
       super(HomeInitial()) {
    on<HomeLoadData>(_onLoadData);
    on<HomeRefreshData>(_onRefreshData);
    on<HomeSelectBike>(_onSelectBike);
  }

  void _onLoadData(HomeLoadData event, Emitter<HomeState> emit) async {
    debugPrint('Loading home data');
    emit(HomeLoading());

    try {
      final bikes = await _getBikesUseCase.execute();
      final promotions = await _getPromotionsUseCase.execute();
      final rentalPackages = await _getRentalPackagesUseCase.execute();

      emit(
        HomeLoaded(
          bikes: bikes,
          promotions: promotions,
          rentalPackages: rentalPackages,
        ),
      );
    } catch (e) {
      debugPrint('Error loading home data: $e');
      emit(HomeError(message: 'Failed to load data'));
    }
  }

  void _onRefreshData(HomeRefreshData event, Emitter<HomeState> emit) async {
    debugPrint('Refreshing home data');
    emit(HomeRefreshing());

    try {
      final bikes = await _getBikesUseCase.execute();
      final promotions = await _getPromotionsUseCase.execute();
      final rentalPackages = await _getRentalPackagesUseCase.execute();

      emit(
        HomeLoaded(
          bikes: bikes,
          promotions: promotions,
          rentalPackages: rentalPackages,
        ),
      );
    } catch (e) {
      debugPrint('Error refreshing home data: $e');
      emit(HomeError(message: 'Failed to refresh data'));
    }
  }

  void _onSelectBike(HomeSelectBike event, Emitter<HomeState> emit) {
    debugPrint('Bike selected: ${event.bikeId}');
    emit(HomeBikeSelected(bikeId: event.bikeId));
  }
}
