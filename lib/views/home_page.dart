import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:untitled/widgets/top_movies.dart';
import 'package:untitled/widgets/trending_movies.dart';
import 'package:untitled/widgets/tv_shows.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List popularTVShows = [];
  List topRatedMovies = [];
  final apiKey = '0403412605125c5a0a0d9dd5ee101332';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNDAzNDEyNjA1MTI1YzVhMGEwZDlkZDVlZTEwMTMzMiIsInN1YiI6IjY0NmNjOWRmNzA2YjlmMDBmZTU0MjcyMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.I7d-HKXuJeO6CHwE2jcB9jOGjShlklpKrlYVIfcLUxQ';
  loadMovies() async {
    final tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true, //must be true than only all other logs will be shown
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      popularTVShows = tvShowsResult['results'];
      topRatedMovies = topRatedResult['results'];
    });
    // print('trendingmovies');
    // print(trendingMovies);
    // print('tv');
    // print(popularTVShows);
    // print('topmovie');
    // print(topRatedMovies);
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Movie App')),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          TrendingMovies(trendingMovies: trendingMovies),
          TopRatedMovies(topRatedMovies: topRatedMovies),
          TvShows(tvShows: popularTVShows),
        ],
      ),
    );
  }
}
