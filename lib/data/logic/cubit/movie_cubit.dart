import 'package:bloc/bloc.dart';

part 'movie_states.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitial());
  
}