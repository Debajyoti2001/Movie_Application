import 'package:flutter/material.dart';
import 'package:untitled/widgets/text.dart';

class Description extends StatelessWidget {
  String name;
  String descriptionMessage;
  String backgroundUrl;
  String posterUrl;
  String rating;
  Description(
      {Key? key,
      required this.backgroundUrl,
      required this.descriptionMessage,
      required this.rating,
      required this.name,
      required this.posterUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' + backgroundUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: ModifiedText(
                        text: ' ⭐ Average Rating - ' + rating,
                        color: Colors.white,
                        size: 17,
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height,
              width: double.maxFinite,
              child: ListView(children: [
                const SizedBox(
                  height: 10,
                ),
                ModifiedText(
                  text: name,
                  color: Colors.white,
                  size: 25,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500' + posterUrl,
                        ),
                      )),
                    ),
                    const SizedBox(width: 10,),
                    Flexible(
                      child: ModifiedText(
                        text: descriptionMessage,
                        color: Colors.white,
                        size: 17,
                      ),
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
