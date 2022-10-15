import 'package:fellas_app/utils/config/config.dart';

class AuthHelper {
  static bool isAuthorized() {
    return Config.client.authStore.isValid;
  }
}
