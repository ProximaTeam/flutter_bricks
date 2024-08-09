import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:{{project_name.snakeCase()}}/common/utils/logger.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  TalkerSettings? talkerSettings,
}) async {
  Logger.initialize(talkerSettings);
  Bloc.observer = TalkerBlocObserver(talker: Logger.instance);

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );

  // Only portrait.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setPathUrlStrategy();
  runApp(await builder());
}
