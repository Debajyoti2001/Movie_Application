import 'package:flutter/material.dart';
import 'package:untitled/widgets/text.dart';

import '../views/description_page.dart';

class TrendingMovies extends StatelessWidget {
  List trendingMovies;
  TrendingMovies({Key? key, required this.trendingMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Trending Movies',
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          backgroundUrl: trendingMovies[index]['backdrop_path'],
                          posterUrl: trendingMovies[index]['poster_path'],
                          descriptionMessage: trendingMovies[index]['overview'],
                          rating:
                          trendingMovies[index]['vote_average'].toString(),
                          name: trendingMovies[index]['title'] ?? 'Loading',
                        ),
                      ),
                    );
                  },
                  child: trendingMovies[index]['title'] != null ? SizedBox(
                    width: 240,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trendingMovies[index]['poster_path'],
                                ),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            height: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ModifiedText(
                              text: trendingMovies[index]['title'] ?? 'Loading')
                        ],
                      ),
                    ),
                  ):Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
