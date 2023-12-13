import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:retrofit/retrofit.dart';

part '{{project_name.snakeCase()}}_api_auth.g.dart';

@RestApi()
abstract class {{project_name.pascalCase()}}ApiAuth {
  factory {{project_name.pascalCase()}}ApiAuth(AppConfig config) => _{{project_name.pascalCase()}}ApiAuth(
        _dio,
        baseUrl: config.{{project_name.camelCase()}}ApiUrl,
      );

  static late {{project_name.pascalCase()}}ApiAuth instance;
  static late AppConfig appConfig;

  static void initialize(BuildContext context) {
    instance = Api(context.read<AppConfig>());
    appConfig = context.read<AppConfig>();
  }

  static final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.addAll({
            'Authorization': 'Bearer ${Authentication.accessToken}',
          });

          handler.next(options);
        },
        onError: (e, handler) {
          if (e.response?.statusCode == 403) {
            Authentication.clearAccessToken();
            // navigate to login
          }

          handler.next(e);
        },
      ),
    );

/* 
  Generate GetMeResponse with `mason make model`
  
  @GET('/get-me')
  Future<GetMeResponse> getMe(); 
*/
 
}