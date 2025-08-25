import 'package:bookly/features/Search/Data/Repo/Search_Repo.dart';
import 'package:bookly/features/Search/Presintation/manager/Search_State.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchsearchedbookss({required String type}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchsearchedbooks(type: type);
    result.fold(
      (failure) {
        emit(SearchFailure(errmessage: failure.errormessage));
      },
      (books) {
        emit(SearchSucces(books));
      },
    );
  }
}
