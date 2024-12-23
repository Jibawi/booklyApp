import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:equatable/equatable.dart';

abstract class NewedBooksState extends Equatable {
  const NewedBooksState();

  @override
  List<Object> get props => [];
}

class NewsBooksInitial extends NewedBooksState {}

class NewsBooksLoading extends NewedBooksState {}

class NewsBooksFailure extends NewedBooksState {
  final String errMessage;

  const NewsBooksFailure(this.errMessage);
}

class NewsBooksSuccess extends NewedBooksState {
  final List<BookModelt> books;

  const NewsBooksSuccess(this.books);
}
