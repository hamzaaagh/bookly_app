import 'package:bookly/features/home/data/repo/HomeRepo.dart';
import 'package:bookly/features/home/presintation/manager/Featured_Books_Cubit/Featured_Books_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBookInitial());
  Homerepo homerepo;
  Future<void> fetchfeaturedbooks() async {
    emit(FeaturedBookLoading());
    var result = await homerepo.fetchfeaturedbooks();
    result.fold(
      (failur) {
        emit(FeaturedBookFailure(failur.errormessage));
      },
      (books) {
        emit(FeaturedBookSucces(books));
      },
    );
  }
}
