import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/failure/failure.dart';
import 'package:kliq_movies/core/entities/base_state.dart';

final appControllerProvider =
    StreamNotifierProvider<AppController, BaseState>(AppController.new);

class AppController extends StreamNotifier<BaseState> {
  @override
  Stream<BaseState> build() {
    return FirebaseAuth.instance.authStateChanges().map((User? user) {
      if (user == null) {
        return BaseState.error(Failure('No user', FailureType.authentication));
      }
      return BaseState.success(data: user);
    });
  }
}
