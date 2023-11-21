import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_filmes/data/logic/cubit/movie_cubit.dart';
//import 'package:top_filmes/data/repositories/dio_repository.dart';
import 'package:top_filmes/ui/pages/description_page.dart';

class MovieList extends StatefulWidget {
  const MovieList({required this.movieType, super.key});

  final String movieType;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    movieCubit.takeMovie(widget.movieType);
    super.initState();
  }

  final MovieCubit movieCubit = MovieCubit();
  @override
  Widget build(BuildContext context) {
    // DioRepository dioRepository = DioRepository();

    return BlocBuilder<MovieCubit, MovieStates>(
      bloc: movieCubit,
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MovieSuccess) {
          return GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: List.generate(state.movie.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    //leva para pagina de descrição
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionPage(
                          title: state.movie[index].title,
                          overView: state.movie[index].overView,
                          voteAverage: state.movie[index].voteAverage,
                          posterPath: state.movie[index].posterPath,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      //Reponsavel somente pelo poster
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                state.movie[index].posterPath,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      //Responsavel pelo titulo
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          state.movie[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else if (state is MovieError) {
          return const Center(
            child: Text('Ocorreu um erro com a api'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
