import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    required int pageNumber,
    required String category,
  });
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    required int pageNumber,
    required String category,
  });
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
