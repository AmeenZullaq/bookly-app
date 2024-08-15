import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/features/home/domain/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  late String category;

  Future<void> fetchNewestBooks({required int pageNumber}) async {
    if (pageNumber == 0) {
      emit(
        NewestBooksLoading(),
      );
    } else {
      emit(
        NewestBooksPageinationLoading(),
      );
    }
    var result = await homeRepo.fetchNewestBooks(
      pageNumber: pageNumber,
      category: category,
    );
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            NewestBooksFailure(failure.errorMessage),
          );
        } else {
          emit(
            NewestBooksPageinationFailure(failure.errorMessage),
          );
        }
      },
      (books) {
        emit(
          NewestBooksSuccess(books),
        );
      },
    );
  }
}
