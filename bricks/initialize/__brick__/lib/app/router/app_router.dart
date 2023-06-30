import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/app/router/guards/auth_guard.dart';

// dart run build_runner build/watch
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  factory AppRouter() {
    return _instance ??= AppRouter._();
  }

  AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [];

  static AppRouter? _instance;

  static AppRouter get instance {
    if (_instance == null) {
      throw Exception('AppRouter not initialized.');
    }

    return _instance!;
  }
}
