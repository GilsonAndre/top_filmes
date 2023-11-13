import 'package:flutter/material.dart';
import 'package:top_filmes/data/models/movie_model.dart';
import 'package:top_filmes/data/repositories/dio_repository.dart';
import 'package:top_filmes/ui/resorces/strings.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    DioRepository dioRepository = DioRepository();
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.appName),
            bottom: const TabBar(
              tabs: [
                Text(Strings.popularMovie),
                Text(Strings.topRatedMovie),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
                  future: dioRepository.getMovies(),
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
                            onTap: () {},
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          itens[index].posterPath,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  SizedBox(
                                    child: Text(itens[index].title),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              const Text('Filmes Mais avaliados'),
            ],
          ),
        ),
      ),
    );
  }
}
