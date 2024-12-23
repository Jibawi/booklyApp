import 'package:flutter/material.dart';

class CustomLisViewitem extends StatelessWidget {
  const CustomLisViewitem({super.key, required this.imageurl});

  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(imageurl)),
          ),
        ),
      ),
    );
  }
}
