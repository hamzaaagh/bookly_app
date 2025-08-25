import 'package:bookly/core/Models/book_model/book_model.dart';

abstract class NewestBooksState {
  const NewestBooksState();
}

class NewestBookInitial extends NewestBooksState {}

class NewestBookloading extends NewestBooksState {}

class NewestBookFailure extends NewestBooksState {
  final String errmessage;
  NewestBookFailure(this.errmessage);
}

class NewestBookSucces extends NewestBooksState {
  final List<BookModel> books;
  NewestBookSucces(this.books);
}
