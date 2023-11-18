import '/core.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Map<String, String> headers = {
  'X-RapidAPI-Key': 'a3326c45d7msh893a5b8de13f51bp12d083jsnf71b128614d8',
  'X-RapidAPI-Host': 'anime-db.p.rapidapi.com'
  };

  Future<dynamic> fetchAnimeList({Map<String, dynamic>? query}) async {
    return await _apiServices.callGetAPI(
        AppUrl.animeListEndPoint, headers , Parser.parseAnimeListResponse,query: query!);
  }
}
