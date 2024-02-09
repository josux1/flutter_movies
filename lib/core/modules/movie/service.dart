import 'package:flutter_movies/core/global/core.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';
import 'package:flutter_movies/core/modules/movie/repository.dart';
import 'package:flutter_movies/core/services/database/isar_db.dart';

class MoviesService {
  MoviesService({required this.repository, required this.database});
  final MoviesRepository repository;
  final Database database;

  Future<List<Movie>> getOnTheaters() async {
    final resp = await repository.getOnTheaters();
    return resp?.results ?? [];
  }

  Future<List<Movie>> getPopular() async {
    final resp = await repository.getPopular();
    return resp?.results ?? [];
  }

  Future<bool> existMovies() async {
    return await database.existMovies();
  }

  Future<(List<Movie>, List<Movie>)?> getMoviesDB() async {
    if (await database.existMovies()) {
      final movies = await database.getAllMovies();
      movies.sublist(0, 19);
      return (movies.sublist(0, 19), movies.sublist(19, 39)); // Total 40 movies
    }
    return null;
  }

  Future<void> saveMoviesDB(
      List<Movie> popularMovies, List<Movie> onTheatersMovies) async {
    popularMovies.addAll(onTheatersMovies);
    await database.saveMovies(popularMovies);
    logger.i('Movies saved to db');
  }

  Future<void> deleteMoviesDB() async {
    await database.clearDatabase();
    logger.i('Movies deleted from db');
  }
}
