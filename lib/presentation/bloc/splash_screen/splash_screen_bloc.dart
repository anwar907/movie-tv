import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {

  @override
  SplashScreenState get initialState => SplashScreenInitial();

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async* {
    if (event is SplashScreenStartEvent) {
      // yield SplashScreenLoading();
      // await Future.delayed(Duration(seconds: 3), () {
      //   CircularProgressIndicator();
      // });
      yield SplashScreenLoaded();
    }
  }
}
