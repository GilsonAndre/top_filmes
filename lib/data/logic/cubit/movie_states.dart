part of 'movie_cubit.dart';

abstract class MovieStates {}

class MovieInitial extends MovieStates {}

class MovieLoading extends MovieStates {}

class MovieSuccess extends MovieStates {
  MovieSuccess(this.movie);
  final List<MovieModel> movie;
}

class MovieError extends MovieStates {
  MovieError(this.error);
  final String error;
}
