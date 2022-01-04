import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize() async {
    try {
      final configString = await rootBundle.loadString(
          "config/app_config.json");
      _config = json.decode(configString) as Map<String, dynamic>;
    }on Exception catch(error){
      print(error);
    }
  }


  static String getBaseUrl() {
    return _config["baseUrl"]?.toString()??"";
  }

  static String getClientId() {
    return _config["clientId"]?.toString()??"";
  }

  static String getClientSecret() {
    return _config["clientSecret"]?.toString()??"";
  }

  static String getTokenUrl() {
    return _config["tokenUrl"]?.toString()??"";
  }

}
