import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groovy/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<void> signin();
}

class AuthenticationServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return const Right("Sigup Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "Your password is weak";
      } else if (e.code == "email-already-in-use") {
        message = "Provided email is already in use";
      }
      return Left(message);
    }
  }
}
