import 'package:bookly/core/Widgets/Custom_Loading_Indecator.dart';
import 'package:bookly/core/Widgets/Custom_err_Widget.dart';
import 'package:bookly/features/Search/Presintation/View/Widgets/Search_Result_List_View.dart';
import 'package:bookly/features/Search/Presintation/manager/Search_Cubit.dart';
import 'package:bookly/features/Search/Presintation/manager/Search_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSucces) {
          return SearchResultListView(books: state.books);
        } else if (state is SearchFailure) {
          return CustomErrWidget(errmessage: state.errmessage);
        } else if (state is SearchLoading) {
          return Center(child: CustomLoadingIndecator());
        } else {
          return Container();
        }
      },
    );
  }
}
