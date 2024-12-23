import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/similarbookscubit/similar_books_cubit.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookmodel});
  final BookModelt bookmodel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookmodel.volumeInfo.categories![0],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        bookModelt: widget.bookmodel,
      ),
    );
  }
}
