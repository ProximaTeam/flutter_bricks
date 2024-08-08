import 'package:auto_route/auto_route.dart';
import 'package:{{project_name.snakeCase()}}/app/router/app_router.gr.dart';

// dart run build_runner build/watch
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [];
}
