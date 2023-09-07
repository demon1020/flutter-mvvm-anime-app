import '../core.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    var response = await _myRepo.fetchMoviesList();

    response
        .fold((failure) => setMoviesList(ApiResponse.error(failure.message)),
            (data) async {
      setMoviesList(ApiResponse.completed(data));
    });
    notifyListeners();
  }
}
