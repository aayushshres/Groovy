import 'package:dartz/dartz.dart';
import 'package:groovy/data/models/auth/create_user_req.dart';
import 'package:groovy/data/models/auth/signin_user_req.dart';
import 'package:groovy/data/sources/auth/auth_firebase_service.dart';
import 'package:groovy/domain/repository/auth/auth.dart';
import 'package:groovy/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
