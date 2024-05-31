import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/auth/infrastructure/repository/auth_repository.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, BaseState>((ref) {
  return AuthController(ref: ref);
});

class AuthController extends StateNotifier<BaseState> {
  Ref ref;
  AuthController({
    required this.ref,
  }) : super(const BaseState.initial());

  IAuthRepository get authRepository => ref.read(authRepositoryProvider);

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const BaseState.loading();
    final response = await authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    state = response.fold(
      (failure) => BaseState.error(failure),
      (success) => BaseState<User>.success(data: success),
    );
  }
}
