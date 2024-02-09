import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/ui/modules/movies/movies_details.dart';
import 'package:intl/intl.dart';
import 'package:disposable_cached_images/disposable_cached_images.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';
import 'package:flutter_movies/ui/utils/utils.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const String loadImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgXbnkWYNt9EqBN-GydxJ3F3j4AVeCVkwK4QCgH-GxyKJhsESmcZbLhda5sxjX_FJmYHQ&usqp=CAU';
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => _goDetails(context, movie),
      child: Container(
        height: size.height * 0.27,
        width: size.width * 0.35,
        color: Colors.transparent, // c.primary900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            DisposableCachedImage.network(
              height: size.height * 0.22,
              width: size.width * 0.34,
              imageUrl: movie?.backdropPath != null
                  ? 'https://image.tmdb.org/t/p/original/${movie?.backdropPath}'
                  : loadImage,
              onLoading: (context, height, width) =>
                  const CustomLoadingBox(height: 0.22, width: 0.34),
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(10),
              fadeDuration: const Duration(milliseconds: 0),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                movie?.title ?? 'Title',
                style: t.medium
                    .copyWith(color: isDark ? Colors.white : Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(
                movie?.releaseDate != null
                    ? DateFormat.yMMMEd()
                        .format(movie?.releaseDate ?? DateTime(0))
                    : 'Title',
                style: t.textDisabled.copyWith(fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goDetails(BuildContext context, Movie? movie) {
    Navigator.push(context,
        CupertinoPageRoute(builder: (context) => MovieDetails(movie: movie)));
  }
}
