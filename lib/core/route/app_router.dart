import 'package:auto_route/auto_route.dart';
import 'package:kliq_movies/feature/auth/login_screen.dart';
import 'package:kliq_movies/feature/auth/register_screen.dart';
import 'package:kliq_movies/feature/home/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
