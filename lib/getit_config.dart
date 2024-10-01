import 'package:get_it/get_it.dart';
import 'package:smoke_poc/login/repositories/auth_repository_impl.dart';
import 'package:smoke_poc/login/repositories/auth_repository.dart';
import 'package:smoke_poc/login/services/auth_service_impl.dart';
import 'package:smoke_poc/login/services/auth_service.dart';

final GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerFactory<AuthService>(() => AuthServiceImpl(getIt<AuthRepository>()));
}
