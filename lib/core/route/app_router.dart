import 'package:auto_route/auto_route.dart';
import 'package:kliq_movies/feature/auth/presentation/app_state_observer.dart';
import 'package:kliq_movies/feature/auth/presentation/login_screen.dart';
import 'package:kliq_movies/feature/auth/presentation/register_screen.dart';
import 'package:kliq_movies/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:kliq_movies/feature/home/presentation/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppStateObserverRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
