import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/data/datasource/remote_data_source.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';

part 'tvonair_event.dart';
part 'tvonair_state.dart';

class TvOnAirBloc extends Bloc<TvOnAirEvent, TvOnAirState> {
  @override
  // TODO: implement initialState
  TvOnAirState get initialState => TvOnAirInitialState();

  @override
  Stream<TvOnAirState> mapEventToState(TvOnAirEvent event) async* {
    if (event is TvOnAirStartEvent) {
      var dataOnAir = await RemoteDataSource().getTvOnAir();

      yield TvOnAirLoadedState(dataOnAir);
    } else {
      yield TvOnAirErrorState(message: "Network Error");
    }
  }
}
