import '/core.dart';

class AuthRepository {
  static final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> login(dynamic data) async {
    return await _apiServices.callPostAPI(
        AppUrl.loginEndPint, {}, Parser.parseLogInResponse,
        body: data, disableTokenValidityCheck: true);
  }
}
