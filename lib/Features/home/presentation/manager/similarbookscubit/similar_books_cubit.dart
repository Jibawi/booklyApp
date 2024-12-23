import 'package:appwithmvvm/Features/home/data/repos/home_repo.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/similarbookscubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo homerepo;

  SimilarBooksCubit(this.homerepo) : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homerepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
