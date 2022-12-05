import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'http://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'http://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: [
          Container(
            // padding: EdgeInsets.all(16),
            // height: height / 1.5,
            child: Image.network(path),
          ),
          Container(
            // height: Get.height * 0.421,
            //   width: Get.width,
            transform: Matrix4.translationValues(0.0, -70.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      movie.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    padding: EdgeInsets.only(top: 16),
                    // transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                  ),
                  Container(
                    child: Text(movie.overview),
                    padding: EdgeInsets.only(top: 16),
                    // transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                  ),
                ],
              ),
            ),
          ),
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.star,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.black,
        tooltip: 'Watch',
        elevation: 5,
        splashColor: Colors.grey,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.CenterFloat,
    );
  }
}
