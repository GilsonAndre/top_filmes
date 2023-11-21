import 'package:flutter/material.dart';
import 'package:top_filmes/ui/resorces/app_theme.dart';
import 'package:top_filmes/ui/resorces/strings.dart';
import 'package:top_filmes/ui/components/modified_text.dart';

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
    final AppTheme appTheme = AppTheme();
    return MaterialApp(
      //Define o theme dark para o app
      debugShowCheckedModeBanner: false,
      theme: appTheme.themeDark(),
      home: Scaffold(
        //isso faz com que a foto passe pelo app bar e deixa mais elegante
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //botão de voltar
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.deepOrange,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(posterPath),
                        ),
                      ),
                    ),
                  ),
                  //nota do filme
                  Positioned(
                    bottom: 20,
                    child: Text(
                      '${Strings.note} ${voteAverage.toStringAsFixed(1)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ModifiedText(
                text: Strings.synopsis,
                size: 20,
                color: Colors.deepOrange,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  overView,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
