import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/failure/failure.dart';
import 'package:kliq_movies/feature/auth/infrastructure/entities/users.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository();
});

abstract class IAuthRepository {
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, Users>> getUserDetails({
    required String uuid,
  });
}

class AuthRepository implements IAuthRepository {
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
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

  @override
  Future<Either<Failure, User>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        return Left(Failure.fromException(response));
      }
      await FirebaseFirestore.instance.collection('users').add(
        {
          'name': name,
          'email': email,
          'userId': response.user!.uid,
        },
      );

      return Right(response.user!);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Users>> getUserDetails({required String uuid}) async {
    try {
      final data = await fireStore
          .collection('users')
          .where('userId', isEqualTo: uuid)
          .get();
      final response =
          data.docs.map((doc) => Users.fromJson(doc.data())).toList();
      return Right(response.first);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
