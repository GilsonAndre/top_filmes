import 'package:flutter/material.dart';
//import 'package:top_filmes/data/repositories/dio_repository.dart';
import 'package:top_filmes/ui/resorces/strings.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    //DioRepository dioRepository = DioRepository();
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
              GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                children: List.generate(100, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('aaaaaaa $index'),
                  );
                }),
              ),
              const Text('Filmes Mais avaliados'),
            ],
          ),
        ),
      ),
    );
  }
}
