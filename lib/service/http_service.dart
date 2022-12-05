import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class HttpService {
  final String apiKey = 'd1ce7732b5017597ba1bf1c25978f188';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      // print(jsonResponse);
      List? movies = (moviesMap?.map((i) => Movie.fromJson(i)).toList());
      return movies;
    } else {
      // ignore: avoid_print
      print("fail");
      return null;
    }
  }
}
