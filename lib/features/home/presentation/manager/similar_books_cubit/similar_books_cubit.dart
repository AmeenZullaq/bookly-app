import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/domain/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  final TextEditingController controller = TextEditingController();

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(
      SimilarBooksLoading(),
    );
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(
        SimilarBooksFailure(failure.errorMessage),
      );
    }, (books) {
      emit(
        SimilarBooksSuccess(books),
      );
    });
  }
}
