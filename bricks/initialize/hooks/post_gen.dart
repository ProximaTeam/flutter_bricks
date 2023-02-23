import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await Process.run('flutter', [
    'pub',
    'run',
    'flutter_native_splash:create',
  ]);
}
