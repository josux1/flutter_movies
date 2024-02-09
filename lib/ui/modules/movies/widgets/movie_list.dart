import 'package:flutter/material.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';
import 'package:flutter_movies/ui/modules/movies/widgets/movie_item.dart';
import 'package:flutter_movies/ui/utils/utils.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies, required this.title});
  final String title;
  final List<Movie>? movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent, // c.primary900,
      height: size.height * 0.35,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(title, style: t.title),
          ),
          const SizedBox(height: 7),
          Container(
            color: Colors.transparent, // c.primary900,
            height: size.height * 0.28,
            child: ListView.separated(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(width: 7),
                scrollDirection: Axis.horizontal,
                itemCount: movies?.length ?? 0,
                itemBuilder: (context, index) {
                  final movie = movies?[index];

                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 12 : 0),
                    child: MovieItem(movie: movie),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
