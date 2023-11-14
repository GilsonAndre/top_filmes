import 'package:flutter/material.dart';
import 'package:top_filmes/ui/resorces/strings.dart';
import 'package:top_filmes/ui/resorces/widget/modified_text.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.posterPath,
    super.key,
  });

  final String title;
  final String overView;
  final double voteAverage;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.orangeAccent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(posterPath),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ModifiedText(text: title, size: 25, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: Strings.synopsis, size: 20, color: Colors.deepOrange),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ModifiedText(text: overView, size: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
