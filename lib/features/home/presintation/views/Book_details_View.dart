import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Book_Details_View_Body.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BookDetailsView extends StatelessWidget {
  BookDetailsView({super.key, required this.book});
  BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BookDetailsViewBody(book: book)));
  }
}
