import 'package:flutter/material.dart';
import 'package:top_filmes/ui/resorces/strings.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath,
    super.key,
  });

  final String title;
  final String overView;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(backdropPath),
              ),
            ),
          ),
          Text(title),
          const Text(Strings.synopsis),
          Text(overView),
        ],
      ),
    );
  }
}
