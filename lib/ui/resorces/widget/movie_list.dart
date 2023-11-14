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
      future: dioRepository.getMovies(movieType),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Desculpe Ocorreu um erro ${snapshot.error}');
        } else if (snapshot.hasData) {
          final itens = snapshot.data as List<MovieModel>;
          return GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            children: List.generate(itens.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionPage(
                        title: itens[index].title,
                        overView: itens[index].overView,
                        voteAverage: itens[index].voteAverage,
                        posterPath: itens[index].posterPath,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //fit: BoxFit.fill,
                              image: NetworkImage(
                                itens[index].posterPath,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          itens[index].title,
                          style: const TextStyle(fontSize: 16),
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
