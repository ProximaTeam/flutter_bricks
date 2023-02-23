import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/app/router/guards/auth_guard.dart';

part 'app_router.gr.dart';

// flutter pub run build_runner build/watch
@MaterialAutoRouter(
  routes: [
    AutoRoute(
      initial: true,
      page: SizedBox,
      guards: [AuthGuard],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  factory AppRouter() {
    return _instance ??= AppRouter._(authGuard: AuthGuard());
  }

  AppRouter._({required super.authGuard});

  static AppRouter? _instance;

  static AppRouter get instance {
    if (_instance == null) {
      throw Exception('AppRouter not initialized.');
    }

    return _instance!;
  }
}
