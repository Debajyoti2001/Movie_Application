import 'package:flutter/material.dart';
import 'package:untitled/widgets/text.dart';

import '../views/description_page.dart';

class TvShows extends StatelessWidget {
  List tvShows;
  TvShows({Key? key, required this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top  TV Shows',
            size: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: tvShows.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          backgroundUrl: tvShows[index]['backdrop_path'] ?? tvShows[index]['poster_path'],
                          posterUrl: tvShows[index]['poster_path'],
                          descriptionMessage: tvShows[index]['overview'] != ''
                              ? tvShows[index]['overview']
                              : 'Description  Is Not Available',
                          rating: tvShows[index]['vote_average'].toString(),
                          name: tvShows[index]['name'] ?? 'Loading',
                        ),
                      ),
                    );
                  },
                  child: tvShows[index]['name'] != null
                      ? SizedBox(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvShows[index]['poster_path'],
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                margin: const EdgeInsets.only(right: 10),
                              ),
                              const SizedBox(height: 10,),
                              ModifiedText(
                                  text: tvShows[index]['name'] ?? 'Loading'),
                            ],
                          ),
                        )
                      : const SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
