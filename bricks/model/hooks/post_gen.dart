import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final String modelName = context.vars['model_name'];

  await File('lib/common/common.dart').writeAsString(
    "export 'models/${modelName.snakeCase}/${modelName.snakeCase}.dart';",
    mode: FileMode.append,
  );
}
