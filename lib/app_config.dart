import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class AppConfig {
  factory AppConfig() {
    return _singleton;
  }

  AppConfig._();

  static final AppConfig _singleton = AppConfig._();

  // ignore: non_constant_identifier_names
  static bool get IS_PRODUCTION =>
      kReleaseMode || ENVIRONMENT.toLowerCase().startsWith('prod');
  // // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  static String get ENVIRONMENT => env['ENVIRONMENT'] ?? 'dev';

  // ignore: non_constant_identifier_names
  static String get API_URI => env['API_URI']!;

  Future<void> load() async {
    await DotEnv.load(fileName: 'assets/.env');

    debugPrint('ENVIRONMENT: $ENVIRONMENT');
    debugPrint('API ENDPOINT: $API_URI');
  }
}
