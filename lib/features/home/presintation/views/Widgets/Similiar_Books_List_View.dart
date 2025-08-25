import 'package:bookly/consts.dart';
import 'package:bookly/core/Widgets/Custom_Loading_Indecator.dart';
import 'package:bookly/core/Widgets/Custom_err_Widget.dart';
import 'package:bookly/core/utils/App_Router.dart';

import 'package:bookly/features/home/presintation/manager/Newest_Books_Cubit/Newest_Book_Cubit.dart';
import 'package:bookly/features/home/presintation/manager/Newest_Books_Cubit/Newest_Books_State.dart';

import 'package:bookly/features/home/presintation/views/Widgets/Custom_Book_Image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimiliarBooksListView extends StatelessWidget {
  const SimiliarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBookSucces) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length, // Number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      AppRouter.router.push(
                        kBookDetails,
                        extra: state.books[index],
                      );
                    },
                    child: CustomBookImage(
                      imageurl:
                          state
                              .books[index]
                              .volumeInfo
                              .imageLinks
                              .smallThumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBookFailure) {
          return CustomErrWidget(errmessage: state.errmessage);
        } else {
          return Center(child: CustomLoadingIndecator());
        }
      },
    );
  }
}
