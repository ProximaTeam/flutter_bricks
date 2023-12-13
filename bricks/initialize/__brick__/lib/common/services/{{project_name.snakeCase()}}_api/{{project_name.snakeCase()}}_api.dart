import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:retrofit/retrofit.dart';

part '{{project_name.snakeCase()}}_api.g.dart';

@RestApi()
abstract class {{project_name.pascalCase()}}Api {
  factory {{project_name.pascalCase()}}Api(AppConfig config) => _{{project_name.pascalCase()}}Api(
        _dio,
        baseUrl: config.{{project_name.camelCase()}}ApiUrl,
      );

  static late {{project_name.pascalCase()}}Api instance;
  static late AppConfig appConfig;

  static void initialize(BuildContext context) {
    instance = {{project_name.pascalCase()}}Api(context.read<AppConfig>());
    appConfig = context.read<AppConfig>();
  }

  static final Dio _dio = Dio();

/* 
  Generate LoginResponse and LoginRequest with `mason make model`
  
  @POST('/login')
  Future<LoginResponse> login(
    @Body() LoginRequest data,
  ); 
*/
 
}