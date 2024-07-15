import 'package:dartz/dartz.dart';
import 'package:groovy/core/usecase/usecase.dart';
import 'package:groovy/data/models/auth/create_user_req.dart';
import 'package:groovy/domain/repository/auth/auth.dart';
import 'package:groovy/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
