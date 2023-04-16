class ComingSoonMovieModel {
  final String? thumb, title;

  ComingSoonMovieModel.fromJson(Map<String, dynamic> json)
      : title = json["original_title"],
        thumb = json["poster_path"];
}
