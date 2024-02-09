import 'package:flutter_movies/core/modules/movie/repository.dart';
import 'package:flutter_movies/core/modules/movie/service.dart';
import 'package:flutter_movies/core/services/database/isar_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesRepoProvider = Provider<MoviesRepository>((ref) {
  return MoviesRepository();
});

final moviesServiceProvider = Provider<MoviesService>((ref) {
  final respository = ref.watch(moviesRepoProvider);
  final database = ref.watch(databaseProvider);
  return MoviesService(repository: respository, database: database);
});
