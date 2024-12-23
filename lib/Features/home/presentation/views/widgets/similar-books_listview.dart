import 'package:appwithmvvm/Features/home/presentation/manager/similarbookscubit/similar_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/similarbookscubit/similar_books_state.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:appwithmvvm/core/widgets/custom_error_widget.dart';
import 'package:appwithmvvm/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomLisViewitem(
                    imageurl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                  ),
                );
              }),
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorWidget(errorMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
