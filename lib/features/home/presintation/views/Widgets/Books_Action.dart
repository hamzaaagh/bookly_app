import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:bookly/core/Widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 38,
              child: CustomButton(
                backgroundcolor: Colors.white,
                text: "Free",
                textcolor: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 38,
              child: CustomButton(
                onpressed: () async {
                  Uri url = Uri.parse(book.volumeInfo.previewLink!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                backgroundcolor: Colors.deepOrange,
                text: gettext(book: book),
                textcolor: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String gettext({required BookModel book}) {
  if (book.volumeInfo.previewLink == null) {
    return "Not Available ";
  } else {
    return "Preview";
  }
}
