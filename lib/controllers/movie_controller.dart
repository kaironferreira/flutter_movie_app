import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/models/Movies.dart';
import 'package:flutter_movie_app/repositories/movie_repository.dart';

class MovieController {
  final MovieRepository movieRepository;

  MovieController(
    this.movieRepository,
  ) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _cachedMovies;

  onChanged(String value) {
    List<Movie> list = _cachedMovies!.listMovies
        .where(
          (e) => e.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    movies.value = await movieRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
