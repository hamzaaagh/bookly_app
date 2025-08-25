import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/Search/Presintation/View/Widgets/Search_Result_Body.dart';

import 'package:bookly/features/Search/Presintation/View/Widgets/Search_Text_Field.dart';

import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SearchTextField(),
          const SizedBox(height: 16),
          const Text("Search Result", style: Styles.text18),
          Expanded(child: SearchResultBody()),
        ],
      ),
    );
  }
}
