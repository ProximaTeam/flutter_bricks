import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Logger {
  static void initialize(TalkerSettings? settings) {
    _instance = TalkerFlutter.init(
      settings: settings,
    );
  }

  static Talker? _instance;

  static Talker get instance {
    if (_instance == null) {
      throw Exception('Call Logger.initialize(config) before using instance');
    } else {
      return _instance!;
    }
  }

  static void navigateToLogsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => TalkerScreen(talker: instance),
      ),
    );
  }

  static TalkerRouteObserver get navigatorObserver =>
      TalkerRouteObserver(instance);
}
