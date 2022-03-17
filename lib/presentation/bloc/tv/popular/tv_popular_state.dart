part of 'tv_popular_bloc.dart';

@immutable
abstract class TvPopularState {}

class TvPopularInitialState extends TvPopularState {}

class TvPopularLoadingState extends TvPopularState {}

class TvPopularLoadedState extends TvPopularState {
  final List<TvSeriesModels> tvMovie;
  TvPopularLoadedState(this.tvMovie);
}

class TvPopularDetailsState extends TvPopularState {
  final TvSeriesModels tvSeriesModels;
  TvPopularDetailsState(this.tvSeriesModels);
}

class TvPopularErrorState extends TvPopularState {
  final String message;
  TvPopularErrorState({this.message});
}
