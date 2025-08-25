import 'package:bookly/consts.dart';

import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/core/Models/book_model/book_model.dart';

import 'package:bookly/features/home/presintation/views/Widgets/Custom_Book_Image.dart';

import 'package:bookly/features/home/presintation/views/Widgets/Rating_Row.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          // Get.to(
          //   const BookDetailsView(),
          //   transition: Transition.fade,
          //   arguments: book,
          // );
          GoRouter.of(context).push("/bookdetails", extra: book);
        },
        child: Row(
          children: [
            SizedBox(
              height: 120,
              child: CustomBookImage(
                imageurl: book.volumeInfo.imageLinks.smallThumbnail,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.volumeInfo.title!,
                      style: Styles.text20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    (book.volumeInfo.authors != null &&
                            book.volumeInfo.authors!.isNotEmpty)
                        ? book.volumeInfo.authors![0]
                        : "Unknown Author",
                    style: Styles.text14.copyWith(
                      fontFamily: kptserif.toString(),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text("Free!", style: Styles.text20),
                      Spacer(),
                      RatingRow(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
