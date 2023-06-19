import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiUrlOld => 'http://190.111.249.225/RowingAppApi';

  static String get version => '1.0.0';

  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No está configurado el API_URL';
}
