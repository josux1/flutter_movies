import 'package:dio/dio.dart';
import 'package:flutter_movies/core/global/core.dart';
import 'package:flutter_movies/core/modules/movie/movie.dart';

class MoviesRepository {
  final String _baseUrl = 'https://api.themoviedb.org';
  final String _apikey = '3fd89cb897844ea85dba92bcab6973a0';
  final String _language = 'es-ES';

  Future<MovieCategory> _processAnswer(String url) async {
    final dio = Dio(BaseOptions(baseUrl: _baseUrl));
    final uri = Uri.parse(url).replace(queryParameters: {
      'api_key': _apikey,
      'languaje': _language,
    });
    final answer = await dio.getUri(uri);
    logger.i('Get data: $answer');
    final movies = MovieCategory.fromJson(answer.data);
    logger.i('Get data StatusCode: ${answer.statusCode}');
    return movies;
  }

  Future<MovieCategory?> getOnTheaters() async {
    try {
      final response = await _processAnswer('/3/movie/now_playing');
      return response;
    } catch (error) {
      logger.d('Error Access: ${error.toString()}');
      return null;
    }
  }

  Future<MovieCategory?> getPopular() async {
    try {
      final response = await _processAnswer('/3/movie/top_rated');
      return response;
    } catch (error) {
      logger.d('Error Access: ${error.toString()}');
      return null;
    }
  }
}
