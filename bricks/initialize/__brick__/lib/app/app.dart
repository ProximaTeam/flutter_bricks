import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:{{project_name.snakeCase()}}/app/router/app_router.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.config,
    super.key,
  });

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ListenableProvider<AppRouter>.value(value: AppRouter()),
        RepositoryProvider<AppStorage>.value(value: AppStorage()),
        RepositoryProvider<AppConfig>.value(value: config),
        RepositoryProvider<{{project_name.pascalCase()}}Api>.value(value: {{project_name.pascalCase()}}Api()),
      ],
      child: _AppInitializer(),
    );
  }
}

class _AppInitializer extends StatefulWidget {
  @override
  State<_AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<_AppInitializer> {
  bool isInitialized = false;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    // initialize app here

    context.read<{{project_name.pascalCase()}}Api>().initialize(context);
    await context.read<AppStorage>().initialize();

    setState(() {
      isInitialized = true;
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) return const SizedBox();

    final router = context.read<AppRouter>();

    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: router.delegate(
          navigatorObservers: () => [
            Logger.navigatorObserver,
          ],
        ),
        routeInformationParser: router.defaultRouteParser(),
        builder: (context, child) {
          final overlayStyle = Theme.of(context).appBarTheme.systemOverlayStyle;

          if (overlayStyle != null) {
            SystemChrome.setSystemUIOverlayStyle(overlayStyle);
          }

          return TalkerWrapper(
            talker: Logger.instance,
            child: child ?? const SizedBox(),
          );
        },
      ),
    );
  }
}
