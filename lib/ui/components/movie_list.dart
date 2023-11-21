import 'package:flutter/material.dart';
import 'package:top_filmes/data/models/movie_model.dart';
import 'package:top_filmes/data/repositories/dio_repository.dart';
import 'package:top_filmes/ui/pages/description_page.dart';

class MovieList extends StatelessWidget {
  const MovieList({required this.movieType, super.key});

  final String movieType;

  @override
  Widget build(BuildContext context) {
    DioRepository dioRepository = DioRepository();
    return FutureBuilder(
      //Função do meu repositorio que pega os detalhes dos filmes
      future: dioRepository.getMovies(movieType),
      builder: (context, snapshot) {
        //Caso tenha erros
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Desculpe Ocorreu um erro ${snapshot.error}',
            ),
          );
          //caso tenha dado tudo certo
        } else if (snapshot.hasData) {
          final movies = snapshot.data as List<MovieModel>;
          return GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: List.generate(movies.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    //leva para pagina de descrição
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionPage(
                          title: movies[index].title,
                          overView: movies[index].overView,
                          voteAverage: movies[index].voteAverage,
                          posterPath: movies[index].posterPath,
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
                                movies[index].posterPath,
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
                          movies[index].title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else {
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
