import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/books_action.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:appwithmvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookdetailsSection extends StatelessWidget {
  const BookdetailsSection({super.key, required this.bookModelt});

  final BookModelt bookModelt;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child: CustomLisViewitem(
            imageurl: bookModelt.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Center(
          child: Text(
            bookModelt.volumeInfo.title!,
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            bookModelt.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(
          rating: 5,
          count: 250,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 30),
        BooksAction(
          bookModelt: bookModelt,
        ),
      ],
    );
  }
}
