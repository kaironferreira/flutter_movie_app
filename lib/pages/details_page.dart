import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/Movies.dart';
import 'package:flutter_movie_app/utils/api_utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    ApiUtils.REQUEST_IMG(
                      movie.posterPath,
                    ),
                    loadingBuilder: (_, child, process) {
                      if (process == null) {
                        return child;
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.title,
                  ),
                  Text(
                    movie.originalTitle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.new_releases,
                  ),
                  Text(
                    movie.releaseDate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
