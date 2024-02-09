import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movies/core/services/assets/assets.dart';
import 'package:flutter_movies/ui/utils/utils.dart';
import 'package:flutter_movies/ui/modules/movies/controller.dart';
import 'package:flutter_movies/ui/modules/movies/state.dart';
import 'package:flutter_movies/ui/modules/movies/widgets/movie_big_image.dart';
import 'package:flutter_movies/ui/modules/movies/widgets/movie_list.dart';
import 'package:flutter_movies/ui/modules/movies/widgets/movie_loading_page.dart';

class MoviePage extends ConsumerStatefulWidget {
  const MoviePage({super.key});

  @override
  ConsumerState<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends ConsumerState<MoviePage> {
  @override
  void initState() {
    onStartup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.read(moviesControllerProvider);

    switch (state.state) {
      case States.succesOnline:
        return FadeIn(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              BigImage(image: state.onTheatersMovies?.first.backdropPath),
              MovieList(
                  movies: state.onTheatersMovies, title: 'On Theaters Now'),
              MovieList(movies: state.popularMovies, title: 'Now Playing'),
            ],
          ),
        );
      case States.succesDB:
        return FadeIn(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              BigImage(image: state.onTheatersMovies?.first.backdropPath),
              MovieList(
                  movies: state.onTheatersMovies, title: 'On Theaters Now'),
              MovieList(movies: state.popularMovies, title: 'Now Playing'),
            ],
          ),
        );
      case States.error:
        return ListView(
          children: const [
            Text('error'),
          ],
        );
      case States.empty:
        return FadeIn(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.empty,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hold on..', style: t.subtitle),
                    const Text(
                        'Apears you dont have connection, retry to see the movies catalog.'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () => onStartup(),
                          child: const Text('Retry')),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      case States.loading:
        return const MoviesLoading();
    }
  }

  void onStartup() {
    //if first time, force connect to internet and get movies.
    //get movies and store to local storage

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(moviesControllerProvider.notifier).setLoading();

      final isOnline =
          await ref.read(moviesControllerProvider.notifier).isOnline();
      setState(() {});

      if (isOnline) {
        await ref.read(moviesControllerProvider.notifier).requestMovies();
        setState(() {});
        return;
      }
      await ref.read(moviesControllerProvider.notifier).getMoviesDB();
      setState(() {});
    });
  }
}
