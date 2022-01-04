import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oauth_dio/oauth_dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rent_ready_task/core/config/app_config.dart';
import 'package:rent_ready_task/core/network/client_grant_type.dart';

@module
abstract class AppModule {
  @lazySingleton
  FlutterSecureStorage storage() {
    return const FlutterSecureStorage();
  }

  @lazySingleton
  OAuth oauth(OAuthStorage oAuthStorage, AppConfig appConfig) {
    final oauth = OAuth(
        tokenUrl: appConfig.getTokenUrl(),
        clientId: appConfig.getClientId(),
        clientSecret: appConfig.getClientSecret(),
        storage: oAuthStorage);
    return oauth;
  }

  @lazySingleton
  Dio dio(OAuth oauth, AppConfig appConfig) {
    final dio = Dio(BaseOptions(
        baseUrl: "${appConfig.getBaseUrl()}api/data/v9.2/",
        connectTimeout: 20000,
        receiveTimeout: 10000,
        sendTimeout: 10000));

    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      final token = await oauth.fetchOrRefreshAccessToken().catchError((err) {
        return oauth.requestTokenAndSave(
            ClientGrantType(scope: "${appConfig.getBaseUrl()}.default"));
      });

      if (token != null) {
        options.headers
            .addAll({"Authorization": "Bearer ${token.accessToken}"});
      }

      return handler.next(options);
    }));

    return dio;
  }
}
