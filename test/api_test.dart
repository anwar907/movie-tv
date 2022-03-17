import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:movie_tv/data/constant.dart';

void main() {
  test("API TEST NOWPLAYING", () async {
    var response = await http.get(Uri.parse(Urls.baseurl + Urls.getNowPlaying));
    var result = jsonDecode(response.body);
    print(result);
  });

  test("API TEST UPCOMMING", () async {
    var response = await http.get(Uri.parse(Urls.baseurl + Urls.getUpcoming));
    var result = jsonDecode(response.body);
    print(result);
  });
  test("API TEST POPULAR", () async {
    var response = await http.get(Uri.parse(Urls.baseurl + Urls.getPopularMovie));
    var result = jsonDecode(response.body);
    print(result);
  });
  
  test("API TEST TV POPULAR", () async {
    var response = await http.get(Uri.parse(Urls.baseurl + Urls.tvPopular));
    var result = jsonDecode(response.body);
    print(result);
  });
  test("API TEST TV ON AIR", () async {
    var response = await http.get(Uri.parse(Urls.baseurl + Urls.tvOnTheAir));
    var result = jsonDecode(response.body);
    print(result);
  });
}
