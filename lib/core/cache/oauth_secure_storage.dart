import 'package:injectable/injectable.dart';
import 'package:oauth_dio/oauth_dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@Injectable(as: OAuthStorage)
class OAuthSecureStorage extends OAuthStorage {
  final FlutterSecureStorage storage;
  final accessTokenKey = 'accessToken';
  final refreshTokenKey = 'refreshToken';
  final expirationKey = 'expiration';

  OAuthSecureStorage(this.storage);

  @override
  Future<OAuthToken> fetch() async {
    return OAuthToken(
        accessToken: await storage.read(key: accessTokenKey),
        refreshToken: await storage.read(
          key: refreshTokenKey,
        ),
        expiration: DateTime.fromMillisecondsSinceEpoch(
            int.parse((await storage.read(key: expirationKey) ?? "0"))));
  }

  @override
  Future<OAuthToken> save(OAuthToken token) async {
    await storage.write(key: accessTokenKey, value: token.accessToken);
    await storage.write(key: refreshTokenKey, value: token.refreshToken);
    await storage.write(
        key: expirationKey,
        value: token.expiration!.millisecondsSinceEpoch.toString());
    return token;
  }

  @override
  Future<void> clear() async {
    await storage.delete(key: accessTokenKey);
    await storage.delete(key: refreshTokenKey);
    await storage.delete(key: expirationKey);
  }
}
