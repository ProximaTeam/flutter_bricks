import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final veryGoodCoreProgress = context.logger.progress(
    'Pulling very_good_core',
  );
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
  veryGoodCoreProgress.complete();

  final projectFolder = context.vars['project_name'].toString().snakeCase;
  final web = context.vars['web'] as bool;

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

  final pubGetProgress = context.logger.progress(
    'Running flutter pub get',
  );
  await _handleRun(Process.run('flutter', [
    'pub',
    'add',
    'auto_route',
    'meta',
    'flutter_native_splash',
    'freezed_annotation',
    'json_annotation',
    'theme_tailor_annotation',
    'flutter_secure_storage',
    'flutter_svg',
    'vector_graphics',
    'provider',
    'dio',
    'retrofit',
    'talker',
    'talker_bloc_logger',
    'talker_dio_logger',
    'talker_flutter',
    'talker_logger',
    'url_strategy',
    'dev:freezed',
    'dev:json_serializable',
    'dev:auto_route_generator',
    'dev:build_runner',
    'dev:theme_tailor',
    'dev:retrofit_generator',
  ]));

  pubGetProgress.complete();

  await _handleRun(Process.run('rm', [
    '-rf',
    '.idea',
    '.github',
    'android/app/src/main/res',
    'android/app/src/development',
    'android/app/src/staging',
    'ios/Runner/Assets.xcassets',
    projectFolder,
    'test',
    if (!web) 'web',
    'windows',
    'macos',
    'lib/l10n/arb',
    'lib/counter',
    'lib/app',
    'lib/bootstrap.dart',
    'lib/main_development.dart',
    'lib/main_production.dart',
    'lib/main_staging.dart',
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
