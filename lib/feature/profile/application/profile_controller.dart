import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/auth/infrastructure/entities/users.dart';
import 'package:kliq_movies/feature/auth/infrastructure/repository/auth_repository.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, BaseState<Users>>((ref) {
  return ProfileController(ref: ref);
});

class ProfileController extends StateNotifier<BaseState<Users>> {
  Ref ref;
  ProfileController({
    required this.ref,
  }) : super(const BaseState.initial());

  IAuthRepository get authRepository => ref.read(authRepositoryProvider);

  void getUserDetails() async {
    state = const BaseState.loading();
    final response = await authRepository.getUserDetails(
      uuid: FirebaseAuth.instance.currentUser!.uid,
    );
    state = response.fold(
      (failure) => BaseState.error(failure),
      (success) => BaseState<Users>.success(data: success),
    );
  }
}
