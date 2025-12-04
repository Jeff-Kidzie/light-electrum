import 'package:bloc/bloc.dart';
import 'package:lightweight_electrum/domain/get_bike_detail_use_case.dart';
import 'package:lightweight_electrum/feature/home/bloc/bike_detail_event.dart';
import 'package:lightweight_electrum/feature/home/bloc/bike_detail_state.dart';

class BikeDetailBloc extends Bloc<BikeDetailEvent, BikeDetailState> {
  final GetBikeDetailUseCase getBikeDetailUseCase;

  BikeDetailBloc({required this.getBikeDetailUseCase})
      : super(BikeDetailInitial()) {
    on<BikeDetailLoadData>(_onLoadData);
    on<BikeDetailRefreshData>(_onRefreshData);
  }

  Future<void> _onLoadData(
    BikeDetailLoadData event,
    Emitter<BikeDetailState> emit,
  ) async {
    emit(BikeDetailLoading());
    try {
      final bikeDetail = await getBikeDetailUseCase.execute(event.bikeId);
      if (bikeDetail != null) {
        emit(BikeDetailLoaded(bikeDetail));
      } else {
        emit(BikeDetailError('Bike detail not found'));
      }
    } catch (e) {
      emit(BikeDetailError('Failed to load bike detail: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshData(
    BikeDetailRefreshData event,
    Emitter<BikeDetailState> emit,
  ) async {
    try {
      final bikeDetail = await getBikeDetailUseCase.execute(event.bikeId);
      if (bikeDetail != null) {
        emit(BikeDetailLoaded(bikeDetail));
      } else {
        emit(BikeDetailError('Bike detail not found'));
      }
    } catch (e) {
      emit(BikeDetailError('Failed to refresh bike detail: ${e.toString()}'));
    }
  }
}
