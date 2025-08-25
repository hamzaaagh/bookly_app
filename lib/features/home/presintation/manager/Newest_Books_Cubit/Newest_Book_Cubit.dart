import 'package:bookly/features/home/data/repo/HomeRepo.dart';
import 'package:bookly/features/home/presintation/manager/Newest_Books_Cubit/Newest_Books_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBooksState> {
  NewestBookCubit(this.homerepo) : super(NewestBookInitial());

  Homerepo homerepo;
  Future<void> fetchNewestbooks() async {
    emit(NewestBookloading());
    var result = await homerepo.fetchnewestrbooks();
    result.fold(
      (failur) {
        emit(NewestBookFailure(failur.errormessage));
      },
      (books) {
        emit(NewestBookSucces(books));
      },
    );
  }
}
