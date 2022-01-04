import 'package:dio/dio.dart';
import 'package:oauth_dio/oauth_dio.dart';

class ClientGrantType extends OAuthGrantType {
  final String scope;

  ClientGrantType({required this.scope});

  /// Prepare Request
  @override
  RequestOptions handle(RequestOptions request) {
    request.data = {"grant_type": "client_credentials", "scope": scope};
    return request;
  }
}
