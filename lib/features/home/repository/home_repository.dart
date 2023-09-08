import '/core.dart';

class HomeRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<dynamic> fetchMoviesList() async {
    return await _apiServices.callGetAPI(
        AppUrl.moviesListEndPoint, {}, Parser.fetchMoviesList,disableTokenValidityCheck: true);
  }
}