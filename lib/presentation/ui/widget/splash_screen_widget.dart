import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_tv/presentation/bloc/dashboard/nowplaying/now_playing_bloc.dart';
import 'package:movie_tv/presentation/bloc/dashboard/popular/popular_bloc.dart';
import 'package:movie_tv/presentation/bloc/dashboard/upcomming/upcomming_bloc.dart';
import 'package:movie_tv/presentation/bloc/tv/popular/tv_popular_bloc.dart';
import 'package:movie_tv/presentation/bloc/tv/tv_on_air/tvonair_bloc.dart';
import 'package:movie_tv/presentation/navigator.dart';
import 'package:movie_tv/presentation/ui/page/menu_navigation/menu_navigation.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => replacePage(
            context,
            MultiBlocProvider(providers: [
              BlocProvider<UpcommingBloc>(
                  create: (BuildContext context) => UpcommingBloc()),
              BlocProvider<PopularBloc>(
                  create: (BuildContext context) => PopularBloc()),
              BlocProvider<NowPlayingBloc>(
                  create: (BuildContext context) => NowPlayingBloc()),
              BlocProvider<TvPopularBloc>(
                  create: (BuildContext context) => TvPopularBloc()),
              BlocProvider<TvOnAirBloc>(
                  create: (BuildContext context) => TvOnAirBloc())
            ], child: MenuNavigationPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Center(
              child: SvgPicture.asset(
            "assets/image/tmdb.svg",
            color: Colors.amber,
            width: 40,
            height: 40,
          ))),
    );
  }
}
