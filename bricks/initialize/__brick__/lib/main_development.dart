import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

void main() {
  bootstrap(
    () => const App(
      config: AppConfig({{project_name.camelCase()}}ApiUrl: ''),
    ),
  );
}
