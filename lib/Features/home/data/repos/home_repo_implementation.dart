import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
import 'package:appwithmvvm/Features/home/data/repos/home_repo.dart';
import 'package:appwithmvvm/core/errors/failures.dart';
import 'package:appwithmvvm/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomerepoImp implements HomeRepo {
  final ApiService apiService;
  HomerepoImp(this.apiService);
  @override
  @override
  Future<Either<Failure, List<BookModelt>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:Programming');
      List<BookModelt> books = [];

      for (var item in data['items']) {
        try {
          books.add(BookModelt.fromJson(item));
        } catch (e) {
          books.add(BookModelt.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModelt>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<BookModelt> books = [];

      for (var item in data['items']) {
        books.add(BookModelt.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModelt>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:Programming');
      List<BookModelt> books = [];

      for (var item in data['items']) {
        books.add(BookModelt.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModelt>>> fetchSearchBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=searchInfo &q=subject:Programming');
      List<BookModelt> books = [];

      for (var item in data['items']) {
        books.add(BookModelt.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}



// import 'package:appwithmvvm/Features/home/data/models/book_model/book_modelt/book_modelt.dart';
// import 'package:appwithmvvm/Features/home/data/repos/home_repo.dart';
// import 'package:appwithmvvm/core/errors/failures.dart';
// import 'package:appwithmvvm/core/utils/api_service.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class HomerepoImp implements HomeRepo {
//   final ApiService apiService;
//   HomerepoImp(this.apiService);

//   @override
//   Future<Either<Failure, List<BookModelt>>> fetchNewestBooks() async {
//     try {
//       var data = await apiService.get(
//           endPoint:
//               'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science');
//       return right(_parseBooks(data));
//     } catch (e) {
//       return _handleError(e);
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModelt>>> fetchFeaturedBooks() async {
//     try {
//       var data = await apiService.get(
//           endPoint:
//               'volumes?Filtering=free-ebooks&Sorting=featured&q=subject:Programming');
//       return right(_parseBooks(data));
//     } catch (e) {
//       return _handleError(e);
//     }
//   }

//   List<BookModelt> _parseBooks(dynamic data) {
//     return (data['items'] as List)
//         .map((item) => BookModelt.fromJson(item))
//         .toList();
//   }

//   Either<Failure, List<BookModelt>> _handleError(dynamic e) {
//     if (e is DioException) {
//       return left(ServerFailure.fromDioError(e));
//     }
//     return left(ServerFailure(e.toString()));
//   }
// }
