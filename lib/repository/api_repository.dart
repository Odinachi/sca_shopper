import 'package:sca_shopper/models/request_model/register_model.dart';
import 'package:sca_shopper/models/response_model/user_model.dart';
import 'package:sca_shopper/services/api_services.dart';
import 'package:sca_shopper/services/cache_service.dart';

import '../models/response_model/login_response_model.dart';

class ApiRepository {
  final apiService = ApiService();
  final cacheService = CacheService();

  Future<({UserModel? user, String? error})> createUser(
      RegisterModel model) async {
    final req =
        await apiService.post(endpoint: "api/v1/users/", data: model.toJson());
    if (req.data != null) {
      return (user: UserModel.fromJson(req.data), error: null);
    } else {
      return (user: null, error: req.error);
    }
  }

  Future<({bool? login, String? error})> loginUser(RegisterModel model) async {
    final req = await apiService.post(
        endpoint: "api/v1/auth/login", data: model.toJson());
    if (req.data != null) {
      final loginmodel = LoginResponseModel.fromJson(req.data);

      if (loginmodel.accessToken != null) {
        await cacheService.saveToken(loginmodel.accessToken ?? "");
      }
      return (login: true, error: null);
    } else {
      return (login: false, error: req.error);
    }
  }
}
