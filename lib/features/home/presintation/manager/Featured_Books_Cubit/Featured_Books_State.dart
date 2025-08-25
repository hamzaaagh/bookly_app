import 'package:bookly/core/Models/book_model/book_model.dart';

class FeaturedBooksState {
  const FeaturedBooksState();
}

class FeaturedBookInitial extends FeaturedBooksState {}

class FeaturedBookLoading extends FeaturedBooksState {}

class FeaturedBookFailure extends FeaturedBooksState {
  final String errmessage;
  const FeaturedBookFailure(this.errmessage);
}

class FeaturedBookSucces extends FeaturedBooksState {
  List<BookModel> books;
  FeaturedBookSucces(this.books);
}
