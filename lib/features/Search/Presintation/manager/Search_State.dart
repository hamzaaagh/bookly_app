import 'package:bookly/core/Models/book_model/book_model.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchSucces extends SearchState {
  final List<BookModel> books;
  SearchSucces(this.books);
}

class SearchFailure extends SearchState {
  final String errmessage;
  SearchFailure({required this.errmessage});
}

class SearchLoading extends SearchState {}
