import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_implementation.dart';

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
}
