import 'package:bookly/consts.dart';
import 'package:bookly/core/Models/book_model/book_model.dart';
import 'package:bookly/features/Search/Presintation/View/Search_View.dart';
import 'package:bookly/features/Splash/presintation/view/splash_view.dart';
import 'package:bookly/features/home/presintation/views/Book_details_View.dart';
import 'package:bookly/features/home/presintation/views/Home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetails,
        builder: (BuildContext context, GoRouterState state) {
          final data = state.extra;
          return BookDetailsView(book: data as BookModel);
        },
      ),
      GoRoute(
        path: kSearchPage,
        builder: (BuildContext context, GoRouterState state) {
          return SearchView();
        },
      ),
    ],
  );
}
