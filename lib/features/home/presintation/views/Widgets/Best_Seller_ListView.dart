import 'package:bookly/core/Widgets/Custom_Loading_Indecator.dart';
import 'package:bookly/core/Widgets/Custom_err_Widget.dart';
import 'package:bookly/features/home/presintation/manager/Newest_Books_Cubit/Newest_Book_Cubit.dart';
import 'package:bookly/features/home/presintation/manager/Newest_Books_Cubit/Newest_Books_State.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Best_Seller_ListView_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBookSucces) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BestSellerListViewItem(book: state.books[index]),
              );
            },
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
