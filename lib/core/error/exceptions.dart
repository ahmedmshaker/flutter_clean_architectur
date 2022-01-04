
class ServerException implements Exception {
  String? message;
  String? statusCode;

  ServerException({this.statusCode, this.message});
}

class CacheException implements Exception {}

class NoInternetException implements Exception {
  String message;

  NoInternetException(this.message);
}
