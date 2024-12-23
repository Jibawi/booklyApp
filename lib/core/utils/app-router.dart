import 'package:appwithmvvm/Features/Splash/presentation/views/splash_view.dart';
import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/Features/home/data/repos/home_repo_implementation.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/similarbookscubit/similar_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/views/home_view.dart';
import 'package:appwithmvvm/Features/home/presentation/views/book_details_view.dart';
import 'package:appwithmvvm/Features/search/presentation/views/search_view.dart';
import 'package:appwithmvvm/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookdetailsView';
  static const kSearchView = '/SearchView';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/HomeView', builder: (context, state) => const HomeView()),
    GoRoute(
        path: '/BookDetailsView',
        builder: (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<HomerepoImp>()),
              child: BookDetailsView(
                bookmodel: state.extra as BookModelt,
              ),
            )),
    GoRoute(
        path: '/SearchView', builder: (context, state) => const SearchView()),
  ]);
}
