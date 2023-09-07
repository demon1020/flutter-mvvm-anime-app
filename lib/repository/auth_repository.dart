
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../data/response/api_response.dart';
import '../resources/app_url.dart';

class AuthRepository {
  static final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> login(dynamic data) async {
    return await _apiServices.callPostAPI(
        AppUrl.loginEndPint, {}, Parser.parseLogInResponse,
        body: data, disableTokenValidityCheck: true);
  }
}
