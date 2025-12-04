abstract class BikeDetailEvent {}

class BikeDetailLoadData extends BikeDetailEvent {
  final String bikeId;

  BikeDetailLoadData(this.bikeId);
}

class BikeDetailRefreshData extends BikeDetailEvent {
  final String bikeId;

  BikeDetailRefreshData(this.bikeId);
}
