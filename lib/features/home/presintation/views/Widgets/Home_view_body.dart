import 'package:bookly/core/utils/Styles.dart';
import 'package:bookly/features/home/presintation/views/Widgets/Best_Seller_ListView.dart';

import 'package:bookly/features/home/presintation/views/Widgets/Custom_App_Bar.dart';
import 'package:bookly/features/home/presintation/views/Widgets/FeuturedListViewBooks.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeuturedListViewBooks(),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Best Seller", style: Styles.text18),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: BestSellerListview()),
      ],
    );
  }
}
