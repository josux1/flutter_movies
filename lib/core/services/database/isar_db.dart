import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';

final databaseProvider = Provider<Database>((ref) {
  return Database();
});

class Database {
  late Future<Isar> database;
  Database() {
    database = _openDatabase();
  }

  Future<Isar> _openDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        MovieSchema,
      ], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  Future<bool> existMovies() async {
    final isar = await database;
    final count = await isar.movies.count();
    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }

  //GetAll
  Future<List<Movie>> getAllMovies() async {
    final isar = await database;
    final list = await isar.movies.where().findAll();
    if (list.isNotEmpty) {
      return list;
    }
    return [];
  }

  //Save all
  Future<void> saveMovies(List<Movie> movies) async {
    final isar = await database;

    await isar.writeTxn(() async {
      await isar.movies.putAll(movies); // insert & update
    });
  }

  Future<void> clearDatabase() async {
    final isar = await database;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

//
}
