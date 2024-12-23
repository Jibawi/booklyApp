import 'package:appwithmvvm/Features/home/data/repos/home_repo_implementation.dart';
import 'package:appwithmvvm/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomerepoImp>(
    HomerepoImp(getIt.get<ApiService>()),
  );
}
