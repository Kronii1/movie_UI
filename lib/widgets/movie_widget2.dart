import 'package:flutter/material.dart';

import '../screens/popular_movie_info_screen.dart';

class PopularMovie extends StatelessWidget {
  final dynamic thump;
  final int id;
  final dynamic title;
  const PopularMovie({
    super.key,
    required this.thump,
    required this.id,
    this.title,
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
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            width: 150,
            height: 150,
            child: Image.network(imgUri + thump),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
