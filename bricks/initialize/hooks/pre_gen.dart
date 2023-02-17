import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await Process.run('mason', [
    'add',
    'very_good_core',
  ]);
  await Process.run('mason', [
    'make',
    'very_good_core',
    '--project_name',
    context.vars['project_name'],
    '--org_name',
    context.vars['org_name'],
  ]);

  final projectFolder = context.vars['project_name'].toString().snakeCase;

  final ls = await Process.run('ls', [
    '-a',
    projectFolder,
  ]);
  final projectContent =
      ls.stdout.toString().split('\n').map((item) => '${projectFolder}/$item');

  await Process.run('mv', [
    ...projectContent,
    '.',
  ]);

  await Process.run('flutter', [
    'pub',
    'add',
    'auto_route',
    'dev:auto_route_generator',
    'dev:build_runner',
  ]).then((value) {
    print("WA DU HEK?");
    print(value.stderr);
    print(value.stdout);
  });

  await Process.run('rm', [
    '-rf',
    '.idea',
    projectFolder,
    'test',
    'web',
    'windows',
    'lib/l10n/arb',
    'lib/counter',
    'lib/app',
  ]);
}
