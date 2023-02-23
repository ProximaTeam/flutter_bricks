import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  // Icons
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

  // Splash screen
  final splashProgress = context.logger.progress(
    'Creating default splash screen',
  );
  final result = await Process.run('flutter', [
    'pub',
    'run',
    'flutter_native_splash:create',
  ]);
  if (result.exitCode != 0) {
    return await run(context);
  }
  splashProgress.complete();
}
