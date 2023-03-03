import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/app/router/app_router.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      builder: (context, child) {
        final overlayStyle = Theme.of(context).appBarTheme.systemOverlayStyle;

        if (overlayStyle != null) {
          SystemChrome.setSystemUIOverlayStyle(overlayStyle);
        }

        return child ?? const SizedBox();
      },
    );
  }
}
