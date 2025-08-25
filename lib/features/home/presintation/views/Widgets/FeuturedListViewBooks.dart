import 'package:bookly/consts.dart';
import 'package:bookly/core/Widgets/Custom_Loading_Indecator.dart';
import 'package:bookly/core/Widgets/Custom_err_Widget.dart';
import 'package:bookly/core/utils/App_Router.dart';
import 'package:bookly/features/home/presintation/manager/Featured_Books_Cubit/Featured_Books_Cubit.dart';
import 'package:bookly/features/home/presintation/manager/Featured_Books_Cubit/Featured_Books_State.dart';

import 'package:bookly/features/home/presintation/views/Widgets/Custom_Book_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeuturedListViewBooks extends StatelessWidget {
  const FeuturedListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBookSucces) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length, // Number of items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 4,
                    top: 8,
                    bottom: 15,
                  ),
                  child: InkWell(
                    onTap: () {
                      AppRouter.router.push(
                        kBookDetails,
                        extra: state.books[index],
                      );
                    },
                    child: CustomBookImage(
                      imageurl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrWidget(errmessage: state.errmessage);
        }
        return Center(child: CustomLoadingIndecator());
      },
    );
  }
}
