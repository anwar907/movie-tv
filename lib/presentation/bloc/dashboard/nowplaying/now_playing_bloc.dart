import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/movie_models.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc({this.remoteDataSource}) : super(NowPlayingLoadingState()) {
    on<NowPlayingStartEvent>(_onStarted);
  }
  final RemoteDataSource? remoteDataSource;

  void _onStarted(NowPlayingEvent event, Emitter<NowPlayingState> emit) async {
    emit(NowPlayingLoadingState());

    try {
      final dataNowPlay = await remoteDataSource!.getNowPlaying();
      emit(NowPlayingLoadedState(dataNowPlay));
    } catch (e) {
      emit(NowPlayingFailureState(message: e.toString()));
    }
  }
}
