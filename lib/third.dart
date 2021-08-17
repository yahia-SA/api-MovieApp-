import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'struct.dart';
// ignore: camel_case_types
class third extends StatelessWidget {
    final List<Movie> movies; 
  final int index;
  third({required this.movies,required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            fullinfo(movies: movies,index: index),
          ],
        ));
  }
}

class fullinfo extends StatelessWidget {
    final List<Movie> movies; 
  final int index;
  fullinfo({required this.movies,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0b151f),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Image.network(
                ("https://image.tmdb.org/t/p/original"+movies[index].poster),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                color: Color(0xff0b151f),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                            initialRating: movies[index].vote_average,
                            minRating: 0,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                            //textDirection: ,
                            allowHalfRating: true,
                            itemCount: 10,
                            itemPadding: EdgeInsets.symmetric(horizontal: .5),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.cyan,
                                ),
                            onRatingUpdate: (value) {}),
                        Text(
                          "${movies[index].voteCount} views",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_alarm,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2h 14m',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white70),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          movies[index].release_date,
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          child: SingleChildScrollView(
                              child: Text(
                            movies[index].about,
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
