import 'package:dartz/dartz.dart';
import 'package:groovy/core/usecase/usecase.dart';
import 'package:groovy/domain/repository/song/song.dart';
import 'package:groovy/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<SongsRepository>().getNewSongs();
  }
}
