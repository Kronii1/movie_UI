class MovieModel {
  final String? thump;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : thump = json["backdrop_path"],
        id = json["id"];
}
