class ApiException implements Exception {
  final String messege;

  ApiException({required this.messege});
}

//personalizar os erros como de falta de internet