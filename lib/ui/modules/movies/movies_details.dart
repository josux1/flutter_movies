import 'package:disposable_cached_images/disposable_cached_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';
import 'package:flutter_movies/ui/modules/movies/controller.dart';
import 'package:flutter_movies/ui/modules/movies/widgets/movie_big_image.dart';
import 'package:flutter_movies/ui/utils/utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MovieDetails extends ConsumerStatefulWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie? movie;

  @override
  ConsumerState<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends ConsumerState<MovieDetails> {
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      isOnline = await ref.read(moviesControllerProvider.notifier).isOnline();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent, foregroundColor: c.primary500),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              BigImage(image: widget.movie?.backdropPath),
              Positioned(
                top: 130,
                child: Center(
                  child: SizedBox(
                    height: size.height * 0.35,
                    width: size.width * 0.5,
                    child: DisposableCachedImage.network(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/${isOnline ? widget.movie?.posterPath : widget.movie?.backdropPath}',
                      fit: BoxFit.cover,
                      onLoading: (context, height, width) =>
                          const CustomLoadingBox(height: 0.35, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                      fadeDuration: const Duration(milliseconds: 0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 190),
          Text(
            widget.movie?.title ?? 'Title',
            style: t.title.copyWith(fontSize: 26),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${DateFormat.yMMMMEEEEd().format(widget.movie?.releaseDate ?? DateTime(0))} ',
              style: t.textDisabled,
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: RatingBar.builder(
              initialRating: widget.movie?.voteAverage ?? 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 10,
              itemSize: 28,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2),
              ignoreGestures: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              onRatingUpdate: (rating) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.movie!.voteAverage?.abs()}/10 - Rating Score',
              style: t.medium
                  .copyWith(color: isDark ? Colors.white : Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(widget.movie?.overview ?? 'Desc',
                style: t.text.copyWith(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
