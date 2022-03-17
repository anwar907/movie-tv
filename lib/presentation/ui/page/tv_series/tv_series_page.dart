import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tv/presentation/bloc/tv/popular/tv_popular_bloc.dart';
import 'package:movie_tv/presentation/bloc/tv/tv_on_air/tvonair_bloc.dart';
import 'package:movie_tv/presentation/ui/page/tv_series/tv_details_movie.dart';
import 'package:movie_tv/presentation/ui/widget/tv_movie_widget.dart';

class TvSeriesPage extends StatelessWidget {
  const TvSeriesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final tvPopularBloc = BlocProvider.of<TvPopularBloc>(context);
    // ignore: close_sinks
    final tvOnAirBloc = BlocProvider.of<TvOnAirBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Tv On The Air",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.yellow[800]),
              ),
            ),
            BlocBuilder<TvOnAirBloc, TvOnAirState>(
                bloc: tvOnAirBloc..add(TvOnAirStartEvent()),
                builder: (context, state) {
                  if (state is TvOnAirLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TvOnAirLoadedState) {
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
                          children: state.tvMovie
                              .map((e) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TvDetailsMovie(
                                                  movieModels: e,
                                                )));
                                  },
                                  child: CustomTvMovieWidget(e)))
                              .toList(),
                        ),
                      ),
                    );
                  } else if (state is TvOnAirErrorState) {
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
                "Tv Popular",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.yellow[800]),
              ),
            ),
            BlocBuilder<TvPopularBloc, TvPopularState>(
                bloc: tvPopularBloc..add(TvPopularStartEvent()),
                builder: (context, state) {
                  if (state is TvPopularLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is TvPopularLoadedState) {
                    return ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: state.tvMovie
                          .map((e) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TvDetailsMovie(
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
                                    e.name,
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
                  } else if (state is TvPopularErrorState) {
                    return Center(
                      child: CircularProgressIndicator(),
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
          ],
        ),
      )),
    );
  }
}
