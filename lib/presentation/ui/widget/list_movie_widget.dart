import 'package:flutter/material.dart';
import 'package:movie_tv/data/models/movie_models.dart';

class CustomListMovie extends StatelessWidget {
  final MovieModels movieModels;
  const CustomListMovie(this.movieModels);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
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
      title: Text(
        movieModels.title!,
        style: TextStyle(fontWeight: FontWeight.bold),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        movieModels.overview!,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
