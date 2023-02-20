import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final pageName = context.vars['page_name'];

  final path = pageName.toString().split('/');

  context.vars['page_name'] = path.last;
  context.vars['path'] = path.map((item) => item.snakeCase).join('/');

  final pubspec = await File('pubspec.yaml').readAsString();

  context.vars['project_name'] = pubspec.split('name: ').last.split('\n').first;
}
