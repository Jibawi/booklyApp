import 'package:appwithmvvm/Features/home/presentation/manager/newsdbooks/news_books_state.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/newsdbooks/newsd_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:appwithmvvm/core/widgets/custom_error_widget.dart';
import 'package:appwithmvvm/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsdBooksCubit, NewedBooksState>(
        builder: (context, state) {
      if (state is NewsBooksSuccess) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BestSellerListViewItem(
                bookModel: state.books[index],
              ),
            );
          },
        );
      } else if (state is NewsBooksFailure) {
        return CustomErrorWidget(errorMessage: state.errMessage);
      } else {
        return const Center(child: CustomLoadingIndicator());
      }
    });
  }
}
