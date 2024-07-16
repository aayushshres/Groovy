import 'package:dartz/dartz.dart';
import 'package:groovy/core/usecase/usecase.dart';
import 'package:groovy/data/models/auth/signin_user_req.dart';
import 'package:groovy/domain/repository/auth/auth.dart';
import 'package:groovy/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
