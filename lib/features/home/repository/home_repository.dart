import '/core.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Map<String, String> headers = {
  'X-RapidAPI-Key': Constant.animeDbApiKey,
  'X-RapidAPI-Host': Constant.animeDbHost,
  };

  Future<dynamic> fetchAnimeList({Map<String, dynamic>? query}) async {
    return await _apiServices.callGetAPI(
        AppUrl.animeListEndPoint, headers , Parser.parseAnimeListResponse,query: query!);
  }
}
