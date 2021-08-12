class Movie {
  final String about; 
  final String poster; 
  final String title; 
  // ignore: non_constant_identifier_names
  final String release_date;
  // ignore: non_constant_identifier_names
  final double vote_average;
  final int voteCount;

  Movie({
    required this.about,
    required this.title,
    required this.poster, 
    // ignore: non_constant_identifier_names
    required this.release_date,
    // ignore: non_constant_identifier_names
    required this.vote_average,
    required this.voteCount,

    }); 

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      about: json["overview"], 
      poster: json["poster_path"], 
      title: json["title"], 
      release_date:json["release_date"],
      vote_average:json["vote_average"].toDouble(),
      voteCount: json["vote_count"]
    );
  }

}