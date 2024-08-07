import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/features/auth/presentation/views/login_view.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_implementation.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/book_details_view.dart';
import 'package:my_bookly/features/home/presentation/views/home_view.dart';
import 'package:my_bookly/features/search/data/repos/search_repo_implementation.dart';
import 'package:my_bookly/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:my_bookly/features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kLoginView = '/loginView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(
            getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      )
    ],
  );
}
