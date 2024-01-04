part of '../{{project_name.snakeCase()}}_api.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.appRouter,
    required this.appStorage,
  });

  final AppRouter appRouter;

  final AppStorage appStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Authorization': 'Bearer ${appStorage.accessToken}',
    });

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 403) {
      // await appStorage.clear();
      // appRouter.replaceAll([]);
    }

    super.onError(err, handler);
  }
}
