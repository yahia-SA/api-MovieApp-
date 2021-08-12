
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'struct.dart';
import 'third.dart';
class SecondScreen extends StatelessWidget {
  final List<Movie> movies; 
  SecondScreen({required this.movies});
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121b28),
      appBar: AppBar(
        backgroundColor: Color(0xff121b28),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Now Playing',
        ),
      ),
      body: Container(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context) => third(index: index, movies: movies,)));
                },
                child: ListItem(index,movies));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15,
              height: 15,
            );
          },
          shrinkWrap: true,
          itemCount: movies.length,
        ),
      ),
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
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://image.tmdb.org/t/p/original"+movies[index].poster)),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
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
                RatingBar.builder(
                    initialRating: (movies[index].vote_average).toDouble(),
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
              ],
            ),
          ),
        ],
      ),
    );

}
}
