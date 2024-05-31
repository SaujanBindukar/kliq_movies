import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/failure/failure.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository();
});

abstract class IAuthRepository {
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRepository implements IAuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        return Left(Failure.fromException(response));
      }
      return Right(response.user!);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
