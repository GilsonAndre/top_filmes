import 'package:flutter/material.dart';
import 'package:top_filmes/data/models/movie_model.dart';
import 'package:top_filmes/data/repositories/dio_repository.dart';
import 'package:top_filmes/ui/resorces/strings.dart';
import 'package:top_filmes/ui/resorces/widget/movie_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    DioRepository dioRepository = DioRepository();

    const String popularTypeMovie = 'popular?';
    const String topRatedTypeMovie = 'top_rated?';

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
          body: const TabBarView(
            children: [
              //Filmes Populares
              MovieList(movieType: popularTypeMovie),
              //Filmes mais avalidods
              MovieList(movieType: topRatedTypeMovie),
            ],
          ),
        ),
      ),
    );
  }
}
