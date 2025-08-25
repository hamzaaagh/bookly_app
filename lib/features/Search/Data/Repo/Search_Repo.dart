// ignore: file_names
import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:bookly/core/errors/failurs.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failurs, List<BookModel>>> fetchsearchedbooks({required String type});
}
