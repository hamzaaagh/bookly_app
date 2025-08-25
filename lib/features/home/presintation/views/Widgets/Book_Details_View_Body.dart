import 'package:bookly/consts.dart';

import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Books_Action.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Custom_Book_Image.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Details_App_Bar.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Rating_Row.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Similiar_Books_List_View.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                const DetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .28),
                  child: CustomBookImage(
                    imageurl: book.volumeInfo.imageLinks.thumbnail,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  book.volumeInfo.title!,
                  style: Styles.text30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  book.volumeInfo.authors?[0] ?? "Unknown author",
                  style: Styles.text14.copyWith(
                    color: Colors.grey,
                    fontFamily: kptserif.toString(),
                  ),
                ),
                const SizedBox(height: 18),
                RatingRow(mainaxisaligment: MainAxisAlignment.center),
                const SizedBox(height: 37),
                BooksAction(book: book),
                const Expanded(child: SizedBox(height: 40)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.text14.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),
                SimiliarBooksListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
