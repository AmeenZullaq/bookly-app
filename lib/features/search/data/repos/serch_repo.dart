import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/models/book_model/book_model.dart';

abstract class searchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String searchName});
}
