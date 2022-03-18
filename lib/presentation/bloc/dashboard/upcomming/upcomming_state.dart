part of 'upcomming_bloc.dart';

@immutable
abstract class UpcommingState {}

class UpcommingInitialState extends UpcommingState {}

class UpcommingLoadingState extends UpcommingState {}

class UpcommingLoadedState extends UpcommingState {
  final List<MovieModels>? movieUpcomming;
  UpcommingLoadedState(this.movieUpcomming);
}

class UpcommingFailureState extends UpcommingState {
  final String? message;
  UpcommingFailureState({this.message});
}
