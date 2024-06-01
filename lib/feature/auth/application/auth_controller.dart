import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/failure/failure.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/auth/infrastructure/repository/auth_repository.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, BaseState>((ref) {
  return AuthController(ref: ref);
});

class AuthController extends StateNotifier<BaseState> {
  AuthController({
    required this.ref,
  }) : super(const BaseState.initial());
  Ref ref;

  IAuthRepository get authRepository => ref.read(authRepositoryProvider);

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const BaseState.loading();
    final response = await authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    state = response.fold(
      BaseState<Failure>.error,
      (success) => BaseState<User>.success(data: success),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const BaseState.loading();
    final response = await authRepository.signUp(
      email: email,
      password: password,
      name: name,
    );
    state = response.fold(
      BaseState.error,
      (success) => BaseState<User>.success(data: success),
    );
  }
}
