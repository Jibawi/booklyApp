import 'package:appwithmvvm/Features/home/presentation/views/widgets/home_viewbody.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewbody(),
    );
  }
}
