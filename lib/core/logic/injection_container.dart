import 'package:flutter_template/core/network/http_client.dart';
import 'package:flutter_template/core/network/network_info.dart';
import 'package:flutter_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_template/shared/global_contexts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

loadServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl(InternetConnectionChecker()));

  getIt.registerSingleton(() => InternetConnectionChecker());

  // Repositories
  getIt.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl());
}