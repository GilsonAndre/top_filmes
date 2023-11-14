import 'package:flutter/material.dart';
import 'package:top_filmes/ui/resorces/app_theme.dart';
import 'package:top_filmes/ui/resorces/strings.dart';
import 'package:top_filmes/ui/widget/movie_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String popularTypeMovie = 'popular?';
    const String topRatedTypeMovie = 'top_rated?';

    final AppTheme appTheme = AppTheme();
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: appTheme.themeLight(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(Strings.appName),
            bottom: const TabBar(
              indicator: BoxDecoration(),
              tabs: [
                Text(
                  Strings.popularMovie,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  Strings.topRatedMovie,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              //Filmes Populares
              //MovieList responsavel pela edição de tudo assim deixando essa pagina mais limpa
              MovieList(movieType: popularTypeMovie),
              //Filmes mais avalidods
              //MovieList responsavel pela edição de tudo assim deixando essa pagina mais limpa
              MovieList(movieType: topRatedTypeMovie),
            ],
          ),
        ),
      ),
    );
  }
}
