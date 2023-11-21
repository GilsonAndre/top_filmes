import 'package:bloc/bloc.dart';
import 'package:top_filmes/data/models/movie_model.dart';
import 'package:top_filmes/data/repositories/dio_repository.dart';

part 'movie_states.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitial());
  final DioRepository dioRepository = DioRepository();

  Future<void> takeMovie(String typeMovie) async {
    emit(MovieLoading());
    try {
      final List<MovieModel> movies = await dioRepository.getMovies(typeMovie);
      emit(MovieSuccess(movies));
    } catch (e) {
      emit(MovieError('Desculpe ocorreu algum erro com os Filmes'));
    }
  }
}
