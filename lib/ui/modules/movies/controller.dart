import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';
import 'package:flutter_movies/core/modules/movie/service.dart';
import 'package:flutter_movies/core/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'state.dart';

final moviesControllerProvider =
    StateNotifierProvider<MoviesControllerNotifier, MovieState>((ref) {
  final service = ref.watch(moviesServiceProvider);
  return MoviesControllerNotifier(service);
});

class MoviesControllerNotifier extends StateNotifier<MovieState> {
  final MoviesService moviesService;
  MoviesControllerNotifier(this.moviesService) : super(const MovieState());

  void setLoading() {
    state = state.copyWith(
        popularMovies: [], onTheatersMovies: [], state: States.loading);
  }

  Future<bool> isOnline() async {
    final networkResult = await Connectivity().checkConnectivity();
    if (networkResult != ConnectivityResult.wifi &&
        networkResult != ConnectivityResult.mobile) return false;
    return true;
  }

  Future<void> requestMovies() async {
    final popular = await getPopular();
    final onTheaters = await getOnTheaters();

    if (popular.isNotEmpty && onTheaters.isNotEmpty) {
      //If storage is empty, Save movies on local storage
      if (!await moviesService.existMovies()) {
        await moviesService.saveMoviesDB(popular, onTheaters);
      }

      state = state.copyWith(
        popularMovies: popular,
        onTheatersMovies: onTheaters,
        state: States.succesOnline,
      );
      return;
    } else {
      state = state.copyWith(
          popularMovies: [], onTheatersMovies: [], state: States.error);
    }
  }

  Future getMoviesDB() async {
    final movies = await moviesService.getMoviesDB();
    if (movies != null) {
      state = state.copyWith(
          popularMovies: movies.$1,
          onTheatersMovies: movies.$2,
          state: States.succesDB);
      return;
    }
    state = state
        .copyWith(popularMovies: [], onTheatersMovies: [], state: States.empty);
  }

  Future deleteMoviesDB() async {
    await moviesService.deleteMoviesDB();
    state = state
        .copyWith(popularMovies: [], onTheatersMovies: [], state: States.empty);
  }

  Future<List<Movie>> getOnTheaters() async {
    return await moviesService.getOnTheaters();
  }

  Future<List<Movie>> getPopular() async {
    return await moviesService.getPopular();
  }
}
