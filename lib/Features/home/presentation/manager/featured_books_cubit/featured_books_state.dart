import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;
  const FeaturedBooksFailure(this.errorMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModelt> books;
  const FeaturedBooksSuccess(this.books);
}
