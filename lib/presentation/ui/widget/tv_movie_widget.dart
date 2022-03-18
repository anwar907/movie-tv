import 'package:flutter/material.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';

class CustomTvMovieWidget extends StatelessWidget {
  final TvSeriesModels movieModels;
  const CustomTvMovieWidget(this.movieModels);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${movieModels.posterPath}"))),
          ),
          SizedBox(
            width: 70,
            child: Text(
              movieModels.name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
