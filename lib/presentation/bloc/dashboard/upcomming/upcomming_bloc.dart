import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/movie_models.dart';

part 'upcomming_event.dart';
part 'upcomming_state.dart';

class UpcommingBloc extends Bloc<UpcommingEvent, UpcommingState> {
  UpcommingBloc({this.remoteDataSource}) : super(UpcommingLoadingState()) {
    on<UpcommingStartEvent>(_getDataUpcomming);
  }

  final RemoteDataSource? remoteDataSource;
  void _getDataUpcomming(
      UpcommingEvent event, Emitter<UpcommingState> emit) async {
    emit(UpcommingLoadingState());

    try {
      final dataUpcomming = await remoteDataSource!.getUcomming();
      emit(UpcommingLoadedState(dataUpcomming));
    } catch (e) {
      emit(UpcommingFailureState(message: e.toString()));
    }
  }
}
