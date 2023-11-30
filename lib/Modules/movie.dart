class Movie {
  String title;
  String year;
  String genre;
  String image;

  Movie({
    required this.title,
    required this.year,
    required this.genre,
    required this.image
  });

  factory Movie.fromJson(dynamic json){
    return Movie(
        title:json['Title'],
        year:json['Year'],
        genre:json['Genre'],
        image:json['Poster']
    );
  }
}
