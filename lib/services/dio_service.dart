import 'package:dio/dio.dart';

class DioService {
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODI5ZDZkNjYyMjk3NDM5MDIyMDE0NTM3M2U4ZDMyZSIsInN1YiI6IjVmYTk4YjAxM2EzNDBiMDA0MmM0ZDk1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bMENBsgPQHXKFKk3lD52QyVRkHoieWHp0uWvtFWweZA',
        },
      ),
    );
  }
}
