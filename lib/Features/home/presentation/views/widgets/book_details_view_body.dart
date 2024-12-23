import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/custom_book_details-app_bar.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/similar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModelt});
  final BookModelt bookModelt;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SafeArea(
                    child: CustomAppBarBookDetails(),
                  ),
                  BookdetailsSection(
                    bookModelt: bookModelt,
                  ),
                  const SizedBox(height: 50),
                  const SimilarBooksSection(),
                  const SizedBox(height: 50),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
