import 'package:pocketbase/pocketbase.dart';

class Config {
  static const appTitle = 'Fellas';
  static const baseUrl = 'http://127.0.0.1:8090';
  static final client = PocketBase(baseUrl);
}
