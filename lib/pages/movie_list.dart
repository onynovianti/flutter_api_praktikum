import 'package:flutter/material.dart';
import 'package:flutter_api_praktikum/service/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List? movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      // moviesCount = movies.length;
      moviesCount = movies?.length ?? 0;
      // print(moviesCount);
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // service.getPopularMovies().then((value) => {
    //       setState(() {
    //         result = value!;
    //       })
    //     });
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text("Popular Movies"),
        ),
        // ignore: avoid_unnecessary_containers
        body: ListView.builder(
            itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
            itemBuilder: (context, int position) {
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  title: Text(movies![position].title),
                  subtitle: Text(
                    'Rating = ' + movies![position].voteAverage.toString(),
                  ),
                  trailing: Image.network(
                      'http://image.tmdb.org/t/p/w500' +
                          // '/438QXt1E3WJWb3PqNniK0tAE5c1.jpg',
                          movies![position].posterPath,
                      fit: BoxFit.fitWidth),
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => MovieDetail(movies![position]));
                    Navigator.push(context, route);
                  },
                ),
              );
            }));
  }
}
