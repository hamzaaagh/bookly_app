// ignore: file_names
import 'package:bookly/core/errors/failurs.dart';
import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo {
  Future<Either<Failurs, List<BookModel>>> fetchfeaturedbooks();
  Future<Either<Failurs, List<BookModel>>> fetchnewestrbooks();
}
