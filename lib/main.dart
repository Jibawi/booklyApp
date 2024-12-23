import 'package:appwithmvvm/Features/home/data/repos/home_repo_implementation.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/newsdbooks/newsd_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/searchbooks/search_books_cubit.dart';
import 'package:appwithmvvm/constants.dart';
import 'package:appwithmvvm/core/utils/app-router.dart';
import 'package:appwithmvvm/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomerepoImp>())
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) =>
                NewsdBooksCubit(getIt.get<HomerepoImp>())..fetchNewestBooks()),
        BlocProvider(
            create: (context) => SearchBooksCubit(getIt.get<HomerepoImp>())
              ..fetchSearchBooks(category: 'Programming')),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        // home: const SplashView(),
      ),
    );
  }
}
