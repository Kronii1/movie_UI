import 'package:flutter/material.dart';
import 'package:homework2/models/movie_detail_model.dart';
import 'package:homework2/services/api_service.dart';

class PopularMovieInfoScreen extends StatefulWidget {
  final dynamic thump;
  final int id;
  const PopularMovieInfoScreen({
    super.key,
    required this.thump,
    required this.id,
  });

  @override
  State<PopularMovieInfoScreen> createState() => _PopularMovieInfoScreenState();
}

class _PopularMovieInfoScreenState extends State<PopularMovieInfoScreen> {
  late Future<MovieDetailModel> movie;
  late Future<MovieDetailModel> moviegenres;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  final String imgUri = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imgUri + widget.thump),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text("Back to list"),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 180,
              ),
              FutureBuilder(
                future: movie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vote Average ",
                          style: TextStyle(
                            color: Colors.yellow.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Score : ${snapshot.data!.vote}",
                          style: TextStyle(
                            color: Colors.yellow.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "| ${snapshot.data!.runtime} Minute |",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 165,
                          child: Text(
                            "${snapshot.data?.genres}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "StoryLine",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            snapshot.data!.overview,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 70,
                                ),
                                child: Text(
                                  "Buy ticket",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                  return const Text(
                    "no data!",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
