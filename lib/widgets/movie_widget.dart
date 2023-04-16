import 'package:flutter/material.dart';
import 'package:homework2/screens/popular_movie_info_screen.dart';

class PopularMovie extends StatelessWidget {
  final dynamic thump;
  final int id;
  const PopularMovie({
    super.key,
    required this.thump,
    required this.id,
  });

  final String imgUri = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PopularMovieInfoScreen(
              thump: thump,
              id: id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(5, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ]),
            height: 150,
            clipBehavior: Clip.hardEdge,
            child: Image.network(imgUri + thump),
          ),
        ],
      ),
    );
  }
}
