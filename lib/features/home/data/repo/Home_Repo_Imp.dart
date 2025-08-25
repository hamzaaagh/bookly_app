import 'package:bookly/core/errors/failurs.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repo/HomeRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements Homerepo {
  ApiService api;
  HomeRepoImp({required this.api});
  @override
  Future<Either<Failurs, List<BookModel>>> fetchnewestrbooks() async {
    try {
      var data = await api.get(
        endpoint: "?Filtering=free-ebooks&q=Subject:Music",
      );
      List<BookModel> books = [];
      for (var items in data["items"]) {
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailur.fromDioexaption(e));
      }
      return left(Serverfailur(errormessage: e.toString()));
    }
  }

  @override
  Future<Either<Failurs, List<BookModel>>> fetchfeaturedbooks() async {
    try {
      var data = await api.get(endpoint: "?Filtering=free-ebooks&q=music");
      List<BookModel> books = [];
      for (var items in data["items"]) {
        books.add(BookModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailur.fromDioexaption(e));
      }
      return left(Serverfailur(errormessage: e.toString()));
    }
  }
}
