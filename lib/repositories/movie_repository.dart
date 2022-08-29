import 'package:flutter_movie_app/models/Movies.dart';
import 'package:flutter_movie_app/services/dio_service.dart';
import 'package:flutter_movie_app/utils/api_utils.dart';

class MovieRepository {
  final DioService dioService;

  MovieRepository(
    this.dioService,
  );

  Future<Movies> getMovies() async {
    var result = await dioService.getDio().get(ApiUtils.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
