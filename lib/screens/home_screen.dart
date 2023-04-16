import 'package:flutter/material.dart';
import 'package:homework2/models/coming_soon_model.dart';
import 'package:homework2/models/movie_model.dart';
import 'package:homework2/services/api_service.dart';
import 'package:homework2/models/now_movie.dart';
import 'package:homework2/widgets/movie_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovieInfo =
      ApiService.getPopularMovieInfo();
  final Future<List<NowMovieModel>> nowInMovieInfo =
      ApiService.getNowInCinemas();
  final Future<List<ComingSoonMovieModel>> comingSoonMovieInfo =
      ApiService.getComingSoon();

  final String imgUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Popular Movies",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: Flexible(
                      child: FutureBuilder(
                        future: popularMovieInfo,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return popularList(snapshot);
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "Now in Cinemas",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: Expanded(
                      child: FutureBuilder(
                        future: nowInMovieInfo,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: nowInList(snapshot),
                                ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    "Coming",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: Expanded(
                      child: FutureBuilder(
                        future: comingSoonMovieInfo,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      var comingSoonMovies =
                                          snapshot.data![index];
                                      return Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            width: 150,
                                            height: 150,
                                            child: Image.network(
                                                "$imgUrl${comingSoonMovies.thumb}"),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${comingSoonMovies.title}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),

      // 2023/04/15
      // popular 무비 now무비 등
      // 각 종류의 칸을 만들고 ex Column으로
      // 그안에 FutureBuilder()를 사용해서
      // 각 Api사용하기
    );
  }

  ListView nowInList(AsyncSnapshot<List<NowMovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var nowPlaying = snapshot.data![index];
        return PopularMovie(
          thump: nowPlaying.thumb,
          id: nowPlaying.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }

  ListView popularList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularMovie(
          thump: movie.thump,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
