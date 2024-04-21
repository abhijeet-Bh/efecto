import 'package:hive_flutter/hive_flutter.dart';

class AuthTokenBox {
  static const _keyAccessToken = 'accessToken';
  static const _keyRefreshToken = 'refreshToken';

  static late Box _box;

  static setBox(Box box) {
    _box = box;
  }

  static bool get hasAuth => accessToken?.isNotEmpty == true;

  static String? get accessToken => _box.get(_keyAccessToken);

  static String get refreshToken => _box.get(_keyRefreshToken);

  static Future<void> storeLoginToken(
      String accessToken, String refreshToken) async {
    await Future.wait([
      _box.put(_keyAccessToken, accessToken),
      _box.put(_keyRefreshToken, accessToken),
    ]);
  }

  static Future<void> clear() async {
    await _box.clear();
  }
}

class UserInfoBox {
  static const _name = 'accessToken';
  static const _regNum = 'refreshToken';

  static late Box _box;

  static setBox(Box box) {
    _box = box;
  }

  static String? get name => _box.get(_name);

  static String get regNum => _box.get(_regNum);

  static Future<void> storeUserInfo(String name, String reg) async {
    await Future.wait([
      _box.put(_name, name),
      _box.put(_regNum, reg),
    ]);
  }

  static Future<void> clear() async {
    await _box.clear();
  }
}
