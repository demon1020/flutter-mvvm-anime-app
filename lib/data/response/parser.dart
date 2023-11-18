import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core.dart';

class Parser {

  static Future<UserModel> parseLogInResponse(String responseBody) async {
    return UserModel.fromJson(json.decode(responseBody));
  }

  static Future<AnimeListModel> parseAnimeListResponse(String responseBody) async {
    return AnimeListModel.fromJson(json.decode(responseBody));
  }

  static Future<Either<AppException, Q>> parseResponse<Q, R>(
      http.Response response, ComputeCallback<String, R> callback) async {
    if (response == null) {
      print('response is null ');
      return Left(UnknownError());
    } else {
      // log('callback : ${callback.toString()}response.statusCode : ${response.statusCode} | response.body ${response.body}');
      try {
        switch (response.statusCode) {
          case 200:
            {
              var result = await compute(callback, response.body);
              return Right(result as Q);
            }
        // break;
          case 401:
            return Left(ForbiddenError());
            break;
          case 403:
            return Left(UnAuthorizedError());
            break;
          case 404:
            return Left(ServerError(
                statusCode: response.statusCode, message: "File not found"));
            break;
          case 500:
            return Left(ServerError(
                statusCode: response.statusCode, message: "Server Failure"));
            break;
          default:
            return Left(UnknownError(
                statusCode: response.statusCode, message: response.body));
        }
      } catch (e) {
        return Left(UnknownError());
      }
    }
  }
}
