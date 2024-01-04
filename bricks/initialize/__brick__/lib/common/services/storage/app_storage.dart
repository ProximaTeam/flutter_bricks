import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  final _storage = const FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  static const _accessTokenKey =
      '{{project_name.constantCase()}}_ACCESS_TOKEN_KEY';
  static String? _accessToken;

  Future<void> initialize() async {
    _accessToken = await _storage.read(key: _accessTokenKey);
  }

  String? get accessToken => _accessToken;

  Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<void> clear() async {
    _accessToken = null;
    await _storage.deleteAll();
  }
}
