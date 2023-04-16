class MovieDetailModel {
  final String title;
  final List<dynamic> genres;
  final double vote;
  final String overview;
  final int? runtime;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["original_title"],
        genres = json["genres"],
        vote = json["vote_average"],
        runtime = json["runtime"],
        overview = json["overview"];
}
