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
  List<Movie> _toprated = <Movie>[]; 
  List<Movie> _nowplaying = <Movie>[]; 
  List<Movie> _pop = <Movie>[]; 


  @override
  void initState() {
    super.initState(); 
    _popularAllMovies(); 
    now_playing_AllMovies(); 
    top_rated_llMovies(); 
  }

  void _popularAllMovies() async {
    final Popular = await _popular();
    setState(() {
      _pop = Popular; 
    });
  }
void now_playing_AllMovies() async {
    final now_playing = await _now_playing() ;
    setState(() {
      _nowplaying = now_playing; 
    });
  }
void top_rated_llMovies() async {
    final top_rated = await _top_rated();
    setState(() {
      _toprated = top_rated; 
    });
  }

  Future<List<Movie>> _popular() async {
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=f55fbda0cb73b855629e676e54ab6d8e"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }

  }
   Future<List<Movie>> _now_playing() async {
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=f55fbda0cb73b855629e676e54ab6d8e"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }

  }
     Future<List<Movie>> _top_rated() async {
    final response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=f55fbda0cb73b855629e676e54ab6d8e"));
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
      home:Home(now_playing: _nowplaying, popular:_pop , top_rated:_toprated));
    
  }
}
