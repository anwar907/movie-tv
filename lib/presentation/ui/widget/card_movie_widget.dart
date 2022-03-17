import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_tv/data/models/movie_models.dart';

class CustomCardMovie extends StatelessWidget {
  final MovieModels movieModels;
  const CustomCardMovie(this.movieModels);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = movieModels.releaseDate;
    String dateformat = DateFormat.yMMMd('en_US').format(dateTime);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${movieModels.posterPath}"))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  "${movieModels.voteAverage}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 90,
            child: Text(
              movieModels.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            dateformat,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
