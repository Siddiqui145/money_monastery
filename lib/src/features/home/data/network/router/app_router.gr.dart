// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:money_monastery/src/features/home/presentation/screens/landing_screen.dart'
    as _i1;
import 'package:money_monastery/src/features/home/presentation/screens/qnda_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    QndaRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.QndaScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LandingScreen]
class LandingRoute extends _i3.PageRouteInfo<void> {
  const LandingRoute({List<_i3.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.QndaScreen]
class QndaRoute extends _i3.PageRouteInfo<void> {
  const QndaRoute({List<_i3.PageRouteInfo>? children})
      : super(
          QndaRoute.name,
          initialChildren: children,
        );

  static const String name = 'QndaRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
