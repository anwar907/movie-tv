import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/presentation/bloc/dashboard/nowplaying/now_playing_bloc.dart';
import 'package:movie_tv/presentation/bloc/dashboard/popular/popular_bloc.dart';
import 'package:movie_tv/presentation/bloc/dashboard/upcomming/upcomming_bloc.dart';
import 'package:movie_tv/presentation/ui/page/dashboard/dashboard_details_page.dart';
import 'package:movie_tv/presentation/ui/widget/card_movie_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final nowPlayingBloc = BlocProvider.of<NowPlayingBloc>(context);
    // ignore: close_sinks
    final upcomingBloc = BlocProvider.of<UpcommingBloc>(context);
    // ignore: close_sinks
    final popularBloc = BlocProvider.of<PopularBloc>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Upcomming",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.yellow[800]),
              ),
            ),
            BlocBuilder(
                bloc: upcomingBloc..add(UpcommingStartEvent()),
                builder: (context, state) {
                  if (state is UpcommingLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UpcommingLoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                        child: Wrap(
                          children: state.movieUpcomming
                              .map((e) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardDetailsPage(
                                                  movieModels: e,
                                                )));
                                  },
                                  child: CustomCardMovie(e)))
                              .toList(),
                        ),
                      ),
                    );
                  } else if (state is UpcommingFailureState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                        child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ));
                  }
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "NowPlaying",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.yellow[800]),
              ),
            ),
            BlocBuilder(
                bloc: nowPlayingBloc..add(NowPlayingStartEvent()),
                builder: (context, state) {
                  if (state is NowPlayingLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NowPlayingLoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                        child: Wrap(
                          children: state.movieNowPlaying
                              .map((e) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DashboardDetailsPage(
                                                  movieModels: e,
                                                )));
                                  },
                                  child: CustomCardMovie(e)))
                              .toList(),
                        ),
                      ),
                    );
                  } else if (state is NowPlayingFailureState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                        child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ));
                  }
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Popular",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.yellow[800]),
              ),
            ),
            BlocBuilder(
                bloc: popularBloc..add(PopularStartEvent()),
                builder: (context, state) {
                  if (state is PopularLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularLoadedState) {
                    return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: state.moviePopular
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardDetailsPage(
                                                movieModels: e,
                                              )));
                                },
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500/${e.posterPath}"))),
                                    ),
                                  ),
                                  title: Text(
                                    e.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    e.overview,
                                    maxLines: 3,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  trailing: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "${e.voteAverage}",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    );
                  } else if (state is PopularFailureState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                        child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ));
                  }
                })
          ],
        ),
      ),
    ));
  }
}
