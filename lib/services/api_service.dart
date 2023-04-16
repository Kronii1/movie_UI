import 'dart:convert';
import 'package:homework2/models/coming_soon_model.dart';
import 'package:homework2/models/movie_detail_model.dart';
import 'package:homework2/models/movie_model.dart';
import 'package:homework2/models/now_movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String movieApiurl =
      "https://movies-api.nomadcoders.workers.dev";

  static const String movieIdurl =
      "https://movies-api.nomadcoders.workers.dev/movie?id";

  static const String popular = "popular";
  static const String nowIn = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieModel>> getPopularMovieInfo() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse("$movieApiurl/$popular");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> listMovieInfo = jsonDecode(response.body)['results'];
      for (var allMovieinfo in listMovieInfo) {
        movieInstances.add(MovieModel.fromJson(allMovieinfo));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<NowMovieModel>> getNowInCinemas() async {
    List<NowMovieModel> movieInstances = [];
    final url = Uri.parse("$movieApiurl/$nowIn");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> listMovieInfo = jsonDecode(response.body)['results'];
      for (var allMovieinfo in listMovieInfo) {
        movieInstances.add(NowMovieModel.fromJson(allMovieinfo));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<ComingSoonMovieModel>> getComingSoon() async {
    List<ComingSoonMovieModel> movieInstances = [];
    final url = Uri.parse("$movieApiurl/$comingSoon");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> listMovieInfo = jsonDecode(response.body)['results'];
      for (var allMovieinfo in listMovieInfo) {
        movieInstances.add(ComingSoonMovieModel.fromJson(allMovieinfo));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse("$movieIdurl=$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
