import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/movie_models.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  @override
  // TODO: implement initialState
  PopularState get initialState => PopularInitialState();

  @override
  Stream<PopularState> mapEventToState(PopularEvent event) async* {
    if (event is PopularStartEvent) {
      var dataPopular = await RemoteDataSource().getPopular();

      yield PopularLoadedState(dataPopular);
    } else {
      yield PopularFailureState(message: "Network Error");
    }
  }
}
