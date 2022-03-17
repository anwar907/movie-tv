import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';

part 'tv_popular_event.dart';
part 'tv_popular_state.dart';

class TvPopularBloc extends Bloc<TvPopularEvent, TvPopularState> {
  @override
  // TODO: implement initialState
  TvPopularState get initialState => TvPopularInitialState();

  @override
  Stream<TvPopularState> mapEventToState(TvPopularEvent event) async* {
    if (event is TvPopularStartEvent) {
      var dataTvPopular = await RemoteDataSource().getTvPopular();

      yield TvPopularLoadedState(dataTvPopular);
    } else if (event is TvPopularDetailsEvent) {
      var dataTvPopular = await RemoteDataSource().getTvPopular();
      dataTvPopular.map((e) {
        return TvPopularDetailsState(e);
      });
    } else {
      yield TvPopularErrorState(message: "Network Error");
    }
  }
}
