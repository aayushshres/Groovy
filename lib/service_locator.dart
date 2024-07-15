import 'package:get_it/get_it.dart';
import 'package:groovy/data/repository/auth/auth_repository_impl.dart';
import 'package:groovy/data/sources/auth/auth_firebase_service.dart';
import 'package:groovy/domain/repository/auth/auth.dart';
import 'package:groovy/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthenticationServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
