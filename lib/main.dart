import 'dart:convert';

import 'package:flutter/material.dart';
import 'struct.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override 
  _MyApp createState() => _MyApp(); 
}

class _MyApp extends State<MyApp> {

  // ignore: deprecated_member_use
  List<Movie> _movies = <Movie>[]; 

  @override
  void initState() {
    super.initState(); 
    _populateAllMovies(); 
  }

  void _populateAllMovies() async {
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies; 
    });
  }


  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=f55fbda0cb73b855629e676e54ab6d8e"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      home:Home(movies: _movies));
    
  }
}