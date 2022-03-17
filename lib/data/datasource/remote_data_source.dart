import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_tv/data/constant.dart';
import 'package:movie_tv/data/failure.dart';
import 'package:movie_tv/data/models/movie_models.dart';
import 'package:movie_tv/data/models/tv_series_models.dart';

class RemoteDataSource {
  Future<List<MovieModels>> getNowPlaying() async {
    List<MovieModels> listMovie = [];
    try {
      var response =
          await http.get(Uri.parse(Urls.baseurl + Urls.getNowPlaying));
      var result = jsonDecode(response.body);

      if (result == '') {
        return null;
      } else {
        for (Map<String, dynamic> data in result['results']) {
          listMovie.add(MovieModels.fromJson(data));
        }
      }
      return listMovie;
    } catch (e) {
      throw ConnectionFailure(e);
    }
  }

  Future<List<MovieModels>> getUcomming() async {
    List<MovieModels> list = [];
    try {
      var response = await http.get(Uri.parse(Urls.baseurl + Urls.getUpcoming));
      var result = jsonDecode(response.body);

      if (result == '') {
        return null;
      } else {
        for (Map<String, dynamic> data in result['results']) {
          list.add(MovieModels.fromJson(data));
        }
      }
      return list;
    } catch (e) {
      throw ConnectionFailure(e);
    }
  }

  Future<List<MovieModels>> getPopular() async {
    List<MovieModels> list = [];
    try {
      var response =
          await http.get(Uri.parse(Urls.baseurl + Urls.getPopularMovie));
      var result = jsonDecode(response.body);

      if (result == '') {
        return null;
      } else {
        for (Map<String, dynamic> data in result['results']) {
          list.add(MovieModels.fromJson(data));
        }
      }
      return list;
    } catch (e) {
      throw ConnectionFailure(e);
    }
  }

  Future<List<TvSeriesModels>> getTvPopular() async {
    List<TvSeriesModels> list = [];

    try {
      var response = await http.get(Uri.parse(Urls.baseurl + Urls.tvPopular));
      var result = jsonDecode(response.body);

      if (result == '') {
        return null;
      } else {
        for (Map<String, dynamic> data in result['results']) {
          list.add(TvSeriesModels.fromJson(data));
        }
      }
      return list;
    } catch (e) {
      throw ConnectionFailure(e);
    }
  }

  Future<List<TvSeriesModels>> getTvOnAir() async {
    List<TvSeriesModels> list = [];

    try {
      var response = await http.get(Uri.parse(Urls.baseurl + Urls.tvOnTheAir));
      var result = jsonDecode(response.body);
      if (result == '') {
        return null;
      } else {
        for (Map<String, dynamic> data in result['results']) {
          list.add(TvSeriesModels.fromJson(data));
        }
      }
      return list;
    } catch (e) {
      throw ConnectionFailure(e);
    }
  }
}
