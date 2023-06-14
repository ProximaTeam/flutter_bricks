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

  // Icons
  await _makeAppIcons(context);

  // Splash screen
  await _makeSplashScreen(context);
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

Future<void> _makeSplashScreen(HookContext context,
    [int retryCount = 0]) async {
  final splashProgress = context.logger.progress(
    'Creating default splash screen',
  );
  final result = await Process.run('dart', [
    'run',
    'flutter_native_splash:create',
  ]);
  if (result.exitCode != 0) {
    if (retryCount > 2) {
      throw Exception(result.stderr);
    }
    return await _makeSplashScreen(context, retryCount++);
  }
  splashProgress.complete();
}
