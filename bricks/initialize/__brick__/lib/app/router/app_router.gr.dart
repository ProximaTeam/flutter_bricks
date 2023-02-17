// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SizedBoxRoute.name: (routeData) {
      final args = routeData.argsAs<SizedBoxRouteArgs>(
          orElse: () => const SizedBoxRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SizedBox(
          key: args.key,
          width: args.width,
          height: args.height,
          child: args.child,
        ),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SizedBoxRoute.name,
          path: '/sized-box',
          guards: [authGuard],
        )
      ];
}

/// generated route for
/// [SizedBox]
class SizedBoxRoute extends PageRouteInfo<SizedBoxRouteArgs> {
  SizedBoxRoute({
    Key? key,
    double? width,
    double? height,
    Widget? child,
  }) : super(
          SizedBoxRoute.name,
          path: '/sized-box',
          args: SizedBoxRouteArgs(
            key: key,
            width: width,
            height: height,
            child: child,
          ),
        );

  static const String name = 'SizedBoxRoute';
}

class SizedBoxRouteArgs {
  const SizedBoxRouteArgs({
    this.key,
    this.width,
    this.height,
    this.child,
  });

  final Key? key;

  final double? width;

  final double? height;

  final Widget? child;

  @override
  String toString() {
    return 'SizedBoxRouteArgs{key: $key, width: $width, height: $height, child: $child}';
  }
}
