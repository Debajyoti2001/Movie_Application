import 'package:flutter/material.dart';
import 'package:untitled/views/description_page.dart';
import 'package:untitled/widgets/text.dart';

class TopRatedMovies extends StatelessWidget {
  List topRatedMovies;
  TopRatedMovies({Key? key, required this.topRatedMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: topRatedMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          backgroundUrl: topRatedMovies[index]['backdrop_path'],
                          posterUrl: topRatedMovies[index]['poster_path'],
                          descriptionMessage: topRatedMovies[index]['overview'],
                          rating:
                              topRatedMovies[index]['vote_average'].toString(),
                          name: topRatedMovies[index]['title'] ?? 'Loading',
                        ),
                      ),
                    );
                  },
                  child:
                  topRatedMovies[index]['title'] != null ?SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    topRatedMovies[index]['poster_path'],
                              ),
                              fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 200,
                          margin: const EdgeInsets.only(right: 10),
                        ),
                        const SizedBox(height: 10,),
                        ModifiedText(
                            text: topRatedMovies[index]['title'] ?? 'Loading'),
                      ],
                    ),
                  ): const SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
