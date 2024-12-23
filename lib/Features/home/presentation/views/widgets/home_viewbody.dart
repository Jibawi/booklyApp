import 'package:appwithmvvm/Features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:appwithmvvm/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:appwithmvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            // CustomLisViewitem(),
            FeaturedBooksListView(),
            SizedBox(
              height: 15,
            ),
            Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 4,
            ),
            BestSellerListView(),
          ],
        ),
      ),
    );
  }
}
