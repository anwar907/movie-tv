import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/movie_models.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc({this.remoteDataSource}) : super(PopularLoadingState()) {
    on<PopularStartEvent>(_getDataPopular);
  }

  final RemoteDataSource? remoteDataSource;

  void _getDataPopular(PopularEvent event, Emitter<PopularState> emit) async {
    emit(PopularLoadingState());

    try {
      final dataMoviePopular = await remoteDataSource!.getPopular();
      emit(PopularLoadedState(dataMoviePopular));
    } catch (e) {
      emit(PopularFailureState(message: e.toString()));
    }
  }
}
