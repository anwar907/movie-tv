import 'package:equatable/equatable.dart';
import 'package:movie_tv/data/models/movie_models.dart';

class Movie extends Equatable {
  final bool? adult;
  final String? backgroundPath;
  final List<int>? genreId;
  final int? id;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? popularity;
  final String? posterPath;
  final DateTime? releseDate;
  final String? titile;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Movie(
      {this.adult,
      this.backgroundPath,
      this.genreId,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releseDate,
      this.titile,
      this.video,
      this.voteAverage,
      this.voteCount});

  @override
  List<Object?> get props => [
        adult,
        backgroundPath,
        genreId,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releseDate,
        titile,
        video,
        voteAverage,
        voteCount
      ];
}
