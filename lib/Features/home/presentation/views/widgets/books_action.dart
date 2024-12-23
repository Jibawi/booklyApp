import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/core/utils/functions/launch_url.dart';
import 'package:appwithmvvm/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModelt});
  final BookModelt bookModelt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () async {},
              text: "Free",
              textColor: Colors.black,
              backgroundcolor: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomUrl(context, bookModelt.volumeInfo.previewLink);
              },
              fontsize: 16,
              text: getText(bookModelt),
              textColor: Colors.white,
              backgroundcolor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModelt bookModelt) {
    if (bookModelt.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
