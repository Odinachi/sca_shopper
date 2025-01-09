import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  CacheService._privateConstructor();

  static final CacheService _instance = CacheService._privateConstructor();

  factory CacheService() {
    return _instance;
  }

  late final SharedPreferences sharedPreference;

  Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  final _accessKey = "access_token_key";

  Future<void> saveToken(String accessToken) async {
    await sharedPreference.setString(_accessKey, accessToken);
  }

  String? getToken() {
    return sharedPreference.getString(_accessKey);
  }
}
