import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:equatable/equatable.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitial extends SearchBooksState {}

class SearchrBooksLoading extends SearchBooksState {}

class SearchrBooksFailure extends SearchBooksState {
  final String errMessage;

  const SearchrBooksFailure(this.errMessage);
}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookModelt> books;

  const SearchBooksSuccess(this.books);
}
