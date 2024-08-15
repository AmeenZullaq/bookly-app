import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/errors/server_failure.dart';
import 'package:my_bookly/core/services/api_service.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;


  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    required String category,
    required int pageNumber,
  }) async {
    List<BookEntity> books = [];
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=$category&startIndex=${pageNumber * 10}',
      );
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      print('========================================$e');
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure('An error accure, pleas try again'),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    required int pageNumber,
    required String category,
  }) async {
    List<BookEntity> books = [];
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=$category&startIndex=${pageNumber * 10}',
      );
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure('An error accure, pleas try again'),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure('An error accure, pleas try again'),
      );
    }
  }
}
