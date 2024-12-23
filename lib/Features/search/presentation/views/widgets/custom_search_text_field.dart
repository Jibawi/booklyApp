import 'package:appwithmvvm/Features/home/presentation/manager/searchbooks/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: "Search for books...",
        suffixIcon: IconButton(
          onPressed: () {
            // Trigger search when the user clicks the search icon
            _triggerSearch(context, controller.text);
          },
          icon: const Opacity(opacity: .8, child: Icon(Icons.search)),
        ),
      ),
      onSubmitted: (query) {
        // Trigger search when the user presses 'Enter' or 'Search' on keyboard
        _triggerSearch(context, query);
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }

  void _triggerSearch(BuildContext context, String query) {
    if (query.isNotEmpty) {
      context.read<SearchBooksCubit>().fetchSearchBooks(category: query);
    }
  }
}
