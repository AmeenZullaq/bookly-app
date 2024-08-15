import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/errors/failure.dart';
import 'package:my_bookly/core/errors/server_failure.dart';
import 'package:my_bookly/core/services/shared_preferences.dart';
import 'package:my_bookly/features/auth/data/models/user_model.dart';
import 'package:my_bookly/features/auth/domain/entities/user_entity.dart';
import 'package:my_bookly/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        UserModel.fromAuthFirebase(userCredential.user!),
      );
    } catch (e) {
      print('=========================================================$e');
      if (e.toString().contains(Prefs.getString(kError))) {
        if (userCredential?.user != null) {
          return right(
            UserModel.fromAuthFirebase(userCredential!.user!),
          );
        } else {
          return left(
            ServerFailure(e.toString()),
          );
        }
      } else if (e is FirebaseAuthException) {
        return left(
          ServerFailure.fromAuthFirebase(e),
        );
      } else {
        Prefs.setString(kError, e.toString());
        return left(
          ServerFailure('An error accure, Please try again'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> singInwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return right(
        UserModel.fromAuthFirebase(userCredential.user!),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          ServerFailure.fromAuthFirebase(e),
        );
      }
      return left(
        ServerFailure('An error accure, Please try again'),
      );
    }
  }
}
