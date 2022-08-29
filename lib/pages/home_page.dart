import 'package:flutter/material.dart';
import 'package:flutter_movie_app/controllers/movie_controller.dart';
import 'package:flutter_movie_app/models/Movies.dart';
import 'package:flutter_movie_app/repositories/movie_repository.dart';
import 'package:flutter_movie_app/services/dio_service.dart';
import 'package:flutter_movie_app/utils/api_utils.dart';
import 'package:flutter_movie_app/widgets/custom_list_card_widget.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieController _controler = MovieController(
    MovieRepository(
      DioService(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controler.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Movies",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: _controler.onChanged,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controler.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, index) => CustomListCardWidget(
                              movie: movies.listMovies[index]),
                          separatorBuilder: (_, __) => Divider(),
                        )
                      : Center(
                          child: Lottie.asset('assets/lottie.json'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
