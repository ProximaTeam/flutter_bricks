import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await _handleRun(Process.run(
    'mason',
    [
      'add',
      'very_good_core',
    ],
  ));
  await _handleRun(Process.run('mason', [
    'make',
    'very_good_core',
    '--project_name',
    context.vars['project_name'],
    '--org_name',
    context.vars['org_name'],
  ]));

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

  await _handleRun(Process.run('flutter', [
    'pub',
    'add',
    'auto_route',
    'meta',
    'flutter_native_splash',
    'freezed_annotation',
    'json_annotation',
    'dev:freezed',
    'dev:json_serializable',
    'dev:auto_route_generator',
    'dev:build_runner',
    'dev:theme_tailor',
    'theme_tailor_annotation',
  ]));

  await _handleRun(Process.run('rm', [
    '-rf',
    '.idea',
    '.github',
    'android/app/src/main/res',
    'android/app/src/development',
    'android/app/src/staging',
    'ios/Runner.xcodeproj/project.pbxproj',
    'ios/Runner/Assets.xcassets',
    projectFolder,
    'test',
    'web',
    'windows',
    'lib/l10n/arb',
    'lib/counter',
    'lib/app',
    'coverage_badge.svg',
    'README.md',
  ]));
}

Future<void> _handleRun(Future<ProcessResult> runFuture) async {
  final result = await runFuture;

  String? stderr = result.stderr;

  if (stderr?.isNotEmpty ?? false) {
    throw Exception(stderr);
  }
}
