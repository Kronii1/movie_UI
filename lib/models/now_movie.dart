class NowMovieModel {
  final String? thumb, title;
  final int id;

  NowMovieModel.fromJson(Map<String, dynamic> json)
      : title = json["original_title"],
        id = json["id"],
        thumb = json["poster_path"];
}
