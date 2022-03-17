import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/movie_models.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  @override
  // TODO: implement initialState
  NowPlayingState get initialState => NowPlayingInitialState();

  @override
  Stream<NowPlayingState> mapEventToState(
      NowPlayingEvent event) async* {
    if (event is NowPlayingStartEvent) {
      var dataPlaying = await RemoteDataSource().getNowPlaying();

      yield NowPlayingLoadedState(dataPlaying);
    } else {
      yield NowPlayingFailureState(message: "Network Error");
    }
  }
}
