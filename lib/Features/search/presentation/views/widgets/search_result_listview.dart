import 'package:appwithmvvm/Features/home/presentation/manager/searchbooks/search_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/searchbooks/search_books_state.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchresultListView extends StatelessWidget {
  const SearchresultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: BestSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchrBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchrBooksFailure) {
          return Center(child: Text('Error: ${state.errMessage}'));
        }
        return Container();
      },
    );
  }
}
