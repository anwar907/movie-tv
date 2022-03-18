import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';

part 'tvonair_event.dart';
part 'tvonair_state.dart';

class TvOnAirBloc extends Bloc<TvOnAirEvent, TvOnAirState> {
  TvOnAirBloc({this.remoteDataSource}) : super(TvOnAirLoadingState()) {
    on<TvOnAirStartEvent>(_getTvOnAir);
  }

  final RemoteDataSource? remoteDataSource;

  void _getTvOnAir(TvOnAirEvent event, Emitter<TvOnAirState> emit) async {
    emit(TvOnAirLoadingState());

    try {
      final dataTvOnAir = await remoteDataSource!.getTvOnAir();
      emit(TvOnAirLoadedState(dataTvOnAir));
    } catch (e) {
      emit(TvOnAirErrorState(message: e.toString()));
    }
  }
}
