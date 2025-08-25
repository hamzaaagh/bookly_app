import 'package:bookly/core/Models/book_model/book_model.dart';

import 'package:bookly/features/home/presintation/views/Widgets/Best_Seller_ListView_Item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BestSellerListViewItem(book: books[index]),
        );
      },
    );
  }
}
