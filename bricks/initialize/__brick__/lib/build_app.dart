import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:{{project_name.snakeCase()}}/app/router/app_router.dart';

App buildApp(AppConfig config) {
  final appRouter = AppRouter();
  final appStorage = AppStorage();
  final {{project_name.camelCase()}}Api = {{project_name.pascalCase()}}Api();

  return App(
    config: config,
    appRouter: appRouter,
    appStorage: appStorage,
    {{project_name.camelCase()}}Api: {{project_name.camelCase()}}Api,
  );
}
