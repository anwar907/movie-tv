import 'package:flutter/material.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';
import 'package:movie_tv/presentation/ui/widget/ratting_start_widget.dart';

class TvDetailsMovie extends StatelessWidget {
  final TvSeriesModels? movieModels;
  const TvDetailsMovie({this.movieModels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFB9F5FF),
          ),
          SafeArea(
              child: Container(
            color: Color(0xFFFFFFFF),
          )),
          SafeArea(
              child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${movieModels!.backdropPath}"))),
          )),
          SafeArea(
              child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFB9F5FF),
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          movieModels!.name!,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        RatingStarts(
                            rate: movieModels!.voteAverage,
                            totalRate: movieModels!.voteCount)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Color(0xFFB9F5FF),
                        spreadRadius: 15.0,
                        blurRadius: 20,
                      )
                    ]),
                    child: Text(
                      movieModels!.overview!,
                      maxLines: 9,
                    ),
                  ),
                ],
              ),
            ],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          Text("${movieModels!.popularity}")
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.language,
                            color: Colors.lightBlue,
                          ),
                          Text(movieModels!.originCountry![0])
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.date_range),
                          Text(movieModels!.firstAirDate!)
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
