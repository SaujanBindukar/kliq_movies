import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavProvider = StateNotifierProvider<BottomNavProvider, int>((ref) {
  return BottomNavProvider();
});

class BottomNavProvider extends StateNotifier<int> {
  BottomNavProvider() : super(0);

  void changeIndex({
    required int index,
  }) {
    state = index;
  }
}
