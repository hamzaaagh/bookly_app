import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/Search/Data/Repo/Search_Repo_Imp.dart';
import 'package:bookly/features/home/data/repo/Home_Repo_Imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(api: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(api: getIt.get<ApiService>()),
  );
}
