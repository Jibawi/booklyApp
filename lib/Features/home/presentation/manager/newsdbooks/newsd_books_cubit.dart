import 'package:appwithmvvm/Features/home/data/repos/home_repo.dart';
import 'package:appwithmvvm/Features/home/presentation/manager/newsdbooks/news_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsdBooksCubit extends Cubit<NewedBooksState> {
  final HomeRepo homerepo;

  NewsdBooksCubit(this.homerepo) : super(NewsBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(NewsBooksLoading());
    var result = await homerepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewsBooksFailure(failure.errorMessage));
    }, (books) {
      emit(NewsBooksSuccess(books));
    });
  }
}
