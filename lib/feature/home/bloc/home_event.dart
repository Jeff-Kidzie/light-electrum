abstract class HomeEvent {}

class HomeLoadData extends HomeEvent {}

class HomeRefreshData extends HomeEvent {}

class HomeSelectBike extends HomeEvent {
  final String bikeId;

  HomeSelectBike({required this.bikeId});
}
