part of 'tvonair_bloc.dart';

@immutable
abstract class TvOnAirState {}

class TvOnAirInitialState extends TvOnAirState {}

class TvOnAirLoadingState extends TvOnAirState {}

class TvOnAirLoadedState extends TvOnAirState {
  final List<TvSeriesModels>? tvMovie;
  TvOnAirLoadedState(this.tvMovie);
}

class TvOnAirErrorState extends TvOnAirState {
  final String? message;
  TvOnAirErrorState({this.message});
}
