import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  TvPopularBloc({this.remoteDataSource}) : super(TvPopularLoadingState()) {
    on<TvPopularStartEvent>(_getTvPopular);
  }

  final RemoteDataSource? remoteDataSource;

  void _getTvPopular(TvPopularEvent event, Emitter<TvPopularState> emit) async {
    emit(TvPopularLoadingState());
    try {
      final dataTvPopular = await remoteDataSource!.getTvPopular();
      print(dataTvPopular);
      emit(TvPopularLoadedState(dataTvPopular));
    } catch (e) {
      emit(TvPopularErrorState(message: e.toString()));
    }
  }
}
