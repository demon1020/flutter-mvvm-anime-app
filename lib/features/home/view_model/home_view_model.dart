import '/core.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  Map<String, String> query = {
    'page': '1',
    'size': '100',
    'sortBy': 'ranking',
    'sortOrder': 'asc'
  };

  ApiResponse<AnimeListModel> animeList = ApiResponse.loading();

  setAnimeList(ApiResponse<AnimeListModel> response) {
    animeList = response;
  }

  Future<void> fetchAnimeListApi() async {
    setAnimeList(ApiResponse.loading());

    var response = await _myRepo.fetchAnimeList(query: query);

    response.fold((failure) => setAnimeList(ApiResponse.error(failure.message)),
            (data) async {
      setAnimeList(ApiResponse.completed(data));
    });
    notifyListeners();
  }
}
