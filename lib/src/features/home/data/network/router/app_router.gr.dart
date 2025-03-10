// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:money_monastery/src/features/home/presentation/screens/challenges_screen.dart'
    as _i1;
import 'package:money_monastery/src/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:money_monastery/src/features/home/presentation/screens/landing_screen.dart'
    as _i3;
import 'package:money_monastery/src/features/home/presentation/screens/learn_screen.dart'
    as _i4;
import 'package:money_monastery/src/features/home/presentation/screens/post_question_screen.dart'
    as _i5;
import 'package:money_monastery/src/features/home/presentation/screens/profile_screen.dart'
    as _i6;
import 'package:money_monastery/src/features/home/presentation/screens/qnda_screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ChallengesRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChallengesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LandingScreen(),
      );
    },
    LearnRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LearnScreen(),
      );
    },
    PostQuestionRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PostQuestionScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    QndaRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.QndaScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChallengesScreen]
class ChallengesRoute extends _i8.PageRouteInfo<void> {
  const ChallengesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ChallengesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChallengesRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LandingScreen]
class LandingRoute extends _i8.PageRouteInfo<void> {
  const LandingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LearnScreen]
class LearnRoute extends _i8.PageRouteInfo<void> {
  const LearnRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LearnRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostQuestionScreen]
class PostQuestionRoute extends _i8.PageRouteInfo<void> {
  const PostQuestionRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PostQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostQuestionRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.QndaScreen]
class QndaRoute extends _i8.PageRouteInfo<void> {
  const QndaRoute({List<_i8.PageRouteInfo>? children})
      : super(
          QndaRoute.name,
          initialChildren: children,
        );

  static const String name = 'QndaRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
