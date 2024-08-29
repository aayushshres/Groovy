import 'package:dartz/dartz.dart';
import 'package:groovy/data/sources/songs/song_firebase_service.dart';
import 'package:groovy/domain/repository/song/song.dart';
import 'package:groovy/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
