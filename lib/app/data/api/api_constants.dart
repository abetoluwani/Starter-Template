import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get baseUrl =>
      dotenv.env['API_BASE_URL'] ?? ''; 
      
  static const String authTokenKey = 'auth_token';
  static const int connectionTimeout = 15000;
  static const int receiveTimeout = 15000;
}
