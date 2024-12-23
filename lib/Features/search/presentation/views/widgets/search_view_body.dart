import 'package:appwithmvvm/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:appwithmvvm/Features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:appwithmvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomSearchTextField(),
        ),
        SizedBox(height: 16),
        Text(
          'Search Result',
          style: Styles.textStyle18,
        ),
        SizedBox(height: 16),
        Expanded(
          child: SearchresultListView(),
        ),
      ],
    );
  }
}
