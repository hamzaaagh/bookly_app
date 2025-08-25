import 'package:bookly/consts.dart';
import 'package:bookly/core/utils/App_Router.dart';
import 'package:bookly/core/utils/AssetData.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 20),
      child: Row(
        children: [
          Image.asset(Assetdata.logo, height: 20),
          Spacer(),
          IconButton(
            onPressed: () {
              AppRouter.router.push(kSearchPage);
            },
            icon: Icon(Icons.search, size: 26, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
