import 'package:appwithmvvm/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:appwithmvvm/core/utils/app-router.dart';
import 'package:appwithmvvm/core/widgets/custom_error_widget.dart';
import 'package:appwithmvvm/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                    AppRouter.kBookDetailsView,
                                    extra: state.books[index]);
                              },
                              child: CustomLisViewitem(
                                imageurl: state.books[index].volumeInfo
                                        .imageLinks?.thumbnail ??
                                    '',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ));
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
