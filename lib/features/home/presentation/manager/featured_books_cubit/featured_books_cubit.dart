import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/services/shared_preferences.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/features/home/domain/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  late String category;

  Future<void> fetchFeaturedBooks({
    required int pageNumber,
  }) async {
    if (pageNumber == 0) {
      emit(
        FeaturedBooksLoading(),
      );
    } else {
      emit(
        FeaturedBooksPaginationLoading(),
      );
    }
    var result = await homeRepo.fetchFeaturedBooks(
      pageNumber: pageNumber,
      category: category,
    );
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            FeaturedBooksFailure(failure.errorMessage),
          );
        } else {
          emit(
            FeaturedBooksPaginationFailure(failure.errorMessage),
          );
        }
      },
      (books) {
        Prefs.setBool(kIsUserSearch, true);
        emit(
          FeaturedBooksSuccess(books),
        );
      },
    );
  }
}
