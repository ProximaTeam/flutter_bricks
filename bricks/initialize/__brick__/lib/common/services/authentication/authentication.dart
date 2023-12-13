import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authentication {
  static const _storage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  static const _accessTokenKey =
      '{{project_name.constantCase()}}_ACCESS_TOKEN_KEY';
  static String? _accessToken;

  static Future<void> initialize() async {
    _accessToken = await _storage.read(key: _accessTokenKey);
  }

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  static Future<void> clearAccessToken() async {
    _accessToken = null;
    await _storage.delete(key: _accessTokenKey);
  }
}
