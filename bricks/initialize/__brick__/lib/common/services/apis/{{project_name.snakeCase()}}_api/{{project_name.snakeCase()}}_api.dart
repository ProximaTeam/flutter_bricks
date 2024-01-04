import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/app/router/app_router.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'auth_api/auth_api.dart';
import 'no_auth_api.dart/no_auth_api.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

part 'interceptors/auth_interceptor.dart';

class {{project_name.pascalCase()}}Api {
  void initialize(BuildContext context) {
    final appConfig = context.read<AppConfig>();
    final appStorage = context.read<AppStorage>();
    final appRouter = context.read<AppRouter>();

    authApi = AuthApi(
      Dio()
        ..interceptors.addAll([
          TalkerDioLogger(
            talker: Logger.instance,
          ),
          AuthInterceptor(appRouter: appRouter, appStorage: appStorage),
        ]),
      baseUrl: appConfig.{{project_name.camelCase()}}ApiUrl,
    );
    noAuthApi = NoAuthApi(
      Dio()
        ..interceptors.addAll([
          TalkerDioLogger(
            talker: Logger.instance,
          ),
        ]),
      baseUrl: appConfig.{{project_name.camelCase()}}ApiUrl,
    );
  }

  late final AuthApi authApi;
  late final NoAuthApi noAuthApi;
}
