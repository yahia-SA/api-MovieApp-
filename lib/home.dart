import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Second.dart';
import 'struct.dart';
import 'third.dart';


// ignore: must_be_immutable
class Home extends StatelessWidget {
    final List<Movie> top_rated; 
    final List<Movie> popular; 
    final List<Movie> now_playing; 
    Home({required this.now_playing, required this.top_rated, required this.popular});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        //darkest color
        backgroundColor: Color(0xff0b151f),
        appBar: AppBar(
          title: Text(
            'MovieHunt',
            style: TextStyle(color: Colors.cyan),
          ),
          // second darkest color
          backgroundColor: Color(0xff121b28),
          centerTitle: true,
        ), 
    body:Container(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xff0b151f),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Now Playing',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.cyanAccent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen(movies: top_rated)));
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Colors.cyanAccent),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => third(index: index, movies: now_playing,)));
                            },
                            child: ListItem(index,now_playing));
                      },
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 15,
                          height: 15,
                        );
                      },
                      itemCount: now_playing.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.cyanAccent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen(movies: top_rated)));
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(color: Colors.cyanAccent),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => third(index: index, movies: popular)));
                              },
                              child: Popular(index,popular));
                        },
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsetsDirectional.only(start: 15.0));
                        },
                        itemCount: popular.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
      )
      ,
    );
  }
}

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  final List<Movie> movies; 
  final int index;
  ListItem(this.index, this.movies);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(("https://image.tmdb.org/t/p/original"+movies[index].poster),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            child: Text(
              movies[index].title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: movies[index].vote_average,
                itemSize: 10,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 10,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.cyan,
                ),
                onRatingUpdate: (rating) {},
              ),
              Text(
                "${movies[index].voteCount} views",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Colors.grey,
                size: 15,
              ),
              SizedBox(
                width: 15,
              ),
              Text('2h 14m',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Popular extends StatelessWidget {
  final List<Movie> movies; 
  final int index;
  Popular(this.index, this.movies);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image.network(
              ("https://image.tmdb.org/t/p/original"+movies[index].poster),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            child: Text(
              movies[index].title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
