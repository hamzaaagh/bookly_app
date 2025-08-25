import 'package:bookly/features/Search/Presintation/manager/Search_Cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    return TextField(
      onSubmitted: (value) async {
        await BlocProvider.of<SearchCubit>(
          context,
        ).fetchsearchedbookss(type: value);
      },
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: Icon(Icons.search),
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
    );
  }
}
