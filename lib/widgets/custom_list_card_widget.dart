import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/Movies.dart';
import 'package:flutter_movie_app/pages/details_page.dart';
import 'package:flutter_movie_app/utils/api_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movie movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Image.network(ApiUtils.REQUEST_IMG(movie.posterPath));
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                movie: movie,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    ApiUtils.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.titleMedium,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Spacer(),
                      Text(
                        'Popularidade: ' + movie.popularity.toString(),
                      ),
                      Text(
                        'Votos: ' + movie.voteAverage.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
