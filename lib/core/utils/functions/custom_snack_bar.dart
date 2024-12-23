import 'package:flutter/material.dart';

void customSnackBar(constext, String text) {
  ScaffoldMessenger.of(constext).showSnackBar(
    SnackBar(content: Text(text)),
  );
}
