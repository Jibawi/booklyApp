import 'package:appwithmvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundcolor,
      this.borderRadius,
      required this.textColor,
      required this.text,
      this.fontsize,
      required this.onPressed});

  final Color backgroundcolor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
