part of 'popular_bloc.dart';

@immutable
abstract class PopularState {}

class PopularInitialState extends PopularState {}

class PopularLoadingState extends PopularState {}

class PopularLoadedState extends PopularState {
  final List<MovieModels> moviePopular;
  PopularLoadedState(this.moviePopular);
}

class PopularFailureState extends PopularState {
  final String message;
  PopularFailureState({this.message});
}
