import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/errors/server_failure.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/core/services/api_service.dart';
import 'package:my_bookly/features/search/data/repos/serch_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String searchName,
  }) async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:$searchName',
      );
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
