import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groovy/data/models/auth/create_user_req.dart';
import 'package:groovy/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthenticationServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right("Sigin Successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "invalid-email") {
        message = "Invalid Email";
      } else if (e.code == "invalid-credential") {
        message = "Invalid Credentials";
      }
      return Left(message);
    }
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
        message = "Weak Password";
      } else if (e.code == "email-already-in-use") {
        message = "Email Already In Use";
      }
      return Left(message);
    }
  }
}
