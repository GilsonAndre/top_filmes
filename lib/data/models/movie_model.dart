class MovieModel {
  final int id;
  final String title;
  final String overView;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        id: map['id'],
        title: map['title'],
        overView: map['overview'],
        voteAverage: map['vote_average'],
        posterPath: 
            'https://image.tmdb.org/t/p/original/${map['poster_path']}',
        backdropPath:
            'https://image.tmdb.org/t/p/original/${map['backdrop_path']}',
      );
}
