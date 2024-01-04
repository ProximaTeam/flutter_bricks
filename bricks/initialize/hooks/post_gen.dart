import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await File('analysis_options.yaml').writeAsString(
    """analyzer:
  exclude: 
    - '**.g.dart'
    - '**.freezed.dart'""",
    mode: FileMode.append,
  );

  await File('.gitignore').writeAsString(
    "# The mason local folder.\n.mason",
    mode: FileMode.append,
  );

  // Icons
  await _makeAppIcons(context);

  // Splash screen
  final splashProgress = context.logger.progress(
    'Creating default splash screen',
  );
  await _makeSplashScreen(context);
  splashProgress.complete();

  await _runBuildRunner(context);
  await _runDartFix(context);
}

Future<void> _makeAppIcons(HookContext context) async {
  final iconsProgress = context.logger.progress(
    'Creating default app icons',
  );
  await Process.run('flutter', [
    'pub',
    'global',
    'activate',
    'flutter_launcher_icons',
  ]);
  await Process.run('flutter', [
    'pub',
    'global',
    'run',
    'flutter_launcher_icons',
  ]);
  iconsProgress.complete();
}

Future<void> _makeSplashScreen(
  HookContext context, [
  int retryCount = 0,
]) async {
  final result = await Process.run('dart', [
    'run',
    'flutter_native_splash:create',
  ]);
  if (result.exitCode != 0) {
    if (retryCount > 2) {
      throw Exception(result.stderr);
    }
    return await _makeSplashScreen(context, retryCount + 1);
  }
}

Future<void> _runBuildRunner(HookContext context) async {
  final buildRunnerProgress = context.logger.progress(
    'Runing build runner...',
  );
  await Process.run(
    'dart',
    [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
  );
  buildRunnerProgress.complete();
}

Future<void> _runDartFix(HookContext context) async {
  final dartFixProgress = context.logger.progress(
    'Runing dart fix --apply',
  );
  await Process.run(
    'dart',
    [
      'fix',
      '--apply',
    ],
  );
  dartFixProgress.complete();
}
