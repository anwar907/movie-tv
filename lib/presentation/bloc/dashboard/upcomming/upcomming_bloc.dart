import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/movie_models.dart';

part 'upcomming_event.dart';
part 'upcomming_state.dart';

class UpcommingBloc extends Bloc<UpcommingEvent, UpcommingState> {
  @override
  // TODO: implement initialState
  UpcommingState get initialState => UpcommingInitialState();

  @override
  Stream<UpcommingState> mapEventToState(UpcommingEvent event) async* {
    if (event is UpcommingStartEvent) {
      var dataUpcomming = await RemoteDataSource().getUcomming();

      yield UpcommingLoadedState(dataUpcomming);
    } else {
      yield UpcommingFailureState(message: "Network Error");
    }
  }
}
