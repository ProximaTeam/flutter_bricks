import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  // Splash screen
  await Process.run('flutter', [
    'pub',
    'run',
    'flutter_native_splash:create',
  ]);

  // Icons
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
}
