import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/search/data/repos/serch_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  final TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> fetchSearchBooks() async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(
      searchName: searchController.text.trim(),
    );
    result.fold((failure) {
      emit(
        SearchBooksFailure(failure.errorMessage),
      );
    }, (books) {
      emit(
        SearchBooksSuccess(books),
      );
    });
  }
}
