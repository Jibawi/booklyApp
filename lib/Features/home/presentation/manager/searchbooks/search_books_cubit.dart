import 'package:appwithmvvm/Features/home/data/repos/home_repo.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/searchbooks/search_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final HomeRepo homerepo;

  SearchBooksCubit(this.homerepo) : super(SearchBooksInitial());

  Future<void> fetchSearchBooks({required String category}) async {
    emit(SearchrBooksLoading());
    var result = await homerepo.fetchSearchBooks(category: category);
    result.fold(
      (failure) => emit(SearchrBooksFailure(failure.errorMessage)),
      (books) => emit(SearchBooksSuccess(books)),
    );
  }
}


