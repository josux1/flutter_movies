import 'package:flutter_movies/core/modules/movie/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    List<Movie>? popularMovies,
    List<Movie>? onTheatersMovies,
    @Default(States.loading) States state,
  }) = _MovieState;
}

enum States { succesOnline, error, loading, succesDB, empty }
