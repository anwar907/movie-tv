part of 'now_playing_bloc.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitialState extends NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState {}

class NowPlayingLoadedState extends NowPlayingState {
  final List<MovieModels> movieNowPlaying;
  NowPlayingLoadedState(this.movieNowPlaying);
}

class NowPlayingFailureState extends NowPlayingState {
  final String message;
  NowPlayingFailureState({this.message});
}
