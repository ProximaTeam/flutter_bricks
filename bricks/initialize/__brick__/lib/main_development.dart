import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/build_app.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

void main() {
  bootstrap(
    () => buildApp(const AppConfig({{project_name.camelCase()}}ApiUrl: '')),
  );
}
