import 'package:dartz/dartz.dart';
import 'package:movie_tv/data/failure.dart';
import 'package:movie_tv/domain/entities/movie.dart';

abstract class MovieRepository{
  Future<Either<Failure, Movie>> getMovie(String category);
}