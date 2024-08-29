import 'package:get_it/get_it.dart';
import 'package:groovy/data/repository/auth/auth_repository_impl.dart';
import 'package:groovy/data/repository/song/song_repository_impl.dart';
import 'package:groovy/data/sources/auth/auth_firebase_service.dart';
import 'package:groovy/data/sources/songs/song_firebase_service.dart';
import 'package:groovy/domain/repository/auth/auth.dart';
import 'package:groovy/domain/repository/song/song.dart';
import 'package:groovy/domain/usecases/auth/signin.dart';
import 'package:groovy/domain/usecases/auth/signup.dart';
import 'package:groovy/domain/usecases/auth/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthenticationServiceImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceimpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
