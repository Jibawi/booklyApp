import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModelt>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModelt>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModelt>>> fetchSimilarBooks(
      {required String category});
  Future<Either<Failure, List<BookModelt>>> fetchSearchBooks(
      {required String category});
}

//so the left side is fail side like: Failure
//the right side is the List<bookModel> which is the success

