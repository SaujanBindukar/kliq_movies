import 'package:auto_route/auto_route.dart';
import 'package:kliq_movies/feature/auth/login_screen.dart';
import 'package:kliq_movies/feature/auth/register_screen.dart';
import 'package:kliq_movies/feature/dashboard/dashboard_screen.dart';
import 'package:kliq_movies/feature/home/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
