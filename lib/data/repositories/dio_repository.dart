import 'package:dio/dio.dart';
import 'package:top_filmes/data/erros/exceptions.dart';
import 'package:top_filmes/data/models/movie_model.dart';

//chave da api
const String apiKey = 'https://api.themoviedb.org/3/movie/';

class DioRepository {
  //importando o dio
  final dio = Dio();

  //função responsavel por pegar os filmes e dar o map
  Future<List<MovieModel>> getMovies(String typeMovie) async {
    //usa a url para pegar os filmes da api
    //queryparameters é usado para personalizar como vai vir a minha requisição
    final response = await dio.get(
      '$apiKey$typeMovie',
      queryParameters: {
        'api_key': 'fcbd2848e04db52bc7b9eaa897532e38',
        'language': 'pt-BR',
        'page': '1'
      },
    );

    try {
      //se ocorrer tudo bem vai mostrar os dados da api
      if (response.statusCode == 200) {
        //results é aonde está todo o conteudo da api
        final List<dynamic> results = response.data['results'];
        final List<MovieModel> movies =
            results.map((map) => MovieModel.fromMap(map)).toList();
        return movies;
      } else {
        //Caso de algum tipo de erro vai mostrar aqui
        print('${response.statusCode}');
        throw ApiException(messege: 'Ouve um erro com a api');
      }
    } catch (error, stacktrace) {
      //mensagem de erro basica para mostrar o erro e aonde que está o erro
      throw ApiException(messege: 'Erro foi $error e o stackTrace $stacktrace');
    }
  }
}
