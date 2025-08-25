import 'package:bookly/consts.dart';
import 'package:bookly/core/utils/App_Router.dart';
import 'package:bookly/core/utils/Service_Locator.dart';
import 'package:bookly/features/Search/Data/Repo/Search_Repo_Imp.dart';
import 'package:bookly/features/Search/Presintation/manager/Search_Cubit.dart';

import 'package:bookly/features/home/data/repo/Home_Repo_Imp.dart';
import 'package:bookly/features/home/presintation/manager/Featured_Books_Cubit/Featured_Books_Cubit.dart';
import 'package:bookly/features/home/presintation/manager/Newest_Books_Cubit/Newest_Book_Cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<HomeRepoImp>())
                    ..fetchfeaturedbooks(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewestBookCubit(getIt.get<HomeRepoImp>())..fetchNewestbooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImp>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimarycolor,
          textTheme: GoogleFonts.montserratAlternatesTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
