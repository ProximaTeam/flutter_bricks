import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

void main() {
  bootstrap(
    () => App(
      config: const AppConfig({{project_name.camelCase()}}ApiUrl: ''),
    ),
  );
}
