import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:my_bookly/features/home/data/repos_impl/home_repo_impl.dart';
import 'package:my_bookly/features/search/data/repos/search_repo_implementation.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(),
  );
}
