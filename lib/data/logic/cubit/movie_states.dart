part of 'movie_cubit.dart';

abstract class MovieStates {}

class MovieInitial extends MovieStates {}

class MovieLoading extends MovieStates {}

class MovieSuccess extends MovieStates {}

class MovieError extends MovieStates {}
