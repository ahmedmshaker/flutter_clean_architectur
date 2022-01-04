import 'package:injectable/injectable.dart';
import 'package:rent_ready_task/core/config/config_reader.dart';

@lazySingleton
class AppConfig {
  String getBaseUrl() {
    return ConfigReader.getBaseUrl();
  }

  String getClientId() {
    return ConfigReader.getClientId();
  }

  String getClientSecret() {
    return ConfigReader.getClientSecret();
  }

  String getTokenUrl() {
    return ConfigReader.getTokenUrl();
  }
}
