// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:money_monastery/src/features/home/presentation/auth/login_screen.dart'
    as _i5;
import 'package:money_monastery/src/features/home/presentation/auth/reset_password_screen.dart'
    as _i8;
import 'package:money_monastery/src/features/home/presentation/auth/signup_personal_info_screen.dart'
    as _i9;
import 'package:money_monastery/src/features/home/presentation/auth/signup_screen.dart'
    as _i10;
import 'package:money_monastery/src/features/home/presentation/auth/signup_sub_details_screen.dart'
    as _i11;
import 'package:money_monastery/src/features/home/presentation/screens/challenges_screen.dart'
    as _i1;
import 'package:money_monastery/src/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:money_monastery/src/features/home/presentation/screens/landing_screen.dart'
    as _i3;
import 'package:money_monastery/src/features/home/presentation/screens/learn_screen.dart'
    as _i4;
import 'package:money_monastery/src/features/home/presentation/screens/profile_screen.dart'
    as _i6;
import 'package:money_monastery/src/features/home/presentation/screens/qnda_screen.dart'
    as _i7;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ChallengesRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChallengesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LandingScreen(),
      );
    },
    LearnRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LearnScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    QndaRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.QndaScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ResetPasswordScreen(),
      );
    },
    SignupPersonalInfoRoute.name: (routeData) {
      final args = routeData.argsAs<SignupPersonalInfoRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SignupPersonalInfoScreen(
          key: args.key,
          email: args.email,
          password: args.password,
        ),
      );
    },
    SignupRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignupScreen(),
      );
    },
    SignupSubDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SignupSubDetailsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SignupSubDetailsScreen(
          key: args.key,
          email: args.email,
          name: args.name,
          mobile: args.mobile,
          dob: args.dob,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ChallengesScreen]
class ChallengesRoute extends _i12.PageRouteInfo<void> {
  const ChallengesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ChallengesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChallengesRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LandingScreen]
class LandingRoute extends _i12.PageRouteInfo<void> {
  const LandingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LearnScreen]
class LearnRoute extends _i12.PageRouteInfo<void> {
  const LearnRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LearnRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.QndaScreen]
class QndaRoute extends _i12.PageRouteInfo<void> {
  const QndaRoute({List<_i12.PageRouteInfo>? children})
      : super(
          QndaRoute.name,
          initialChildren: children,
        );

  static const String name = 'QndaRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ResetPasswordScreen]
class ResetPasswordRoute extends _i12.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignupPersonalInfoScreen]
class SignupPersonalInfoRoute
    extends _i12.PageRouteInfo<SignupPersonalInfoRouteArgs> {
  SignupPersonalInfoRoute({
    _i13.Key? key,
    required String email,
    required String password,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SignupPersonalInfoRoute.name,
          args: SignupPersonalInfoRouteArgs(
            key: key,
            email: email,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupPersonalInfoRoute';

  static const _i12.PageInfo<SignupPersonalInfoRouteArgs> page =
      _i12.PageInfo<SignupPersonalInfoRouteArgs>(name);
}

class SignupPersonalInfoRouteArgs {
  const SignupPersonalInfoRouteArgs({
    this.key,
    required this.email,
    required this.password,
  });

  final _i13.Key? key;

  final String email;

  final String password;

  @override
  String toString() {
    return 'SignupPersonalInfoRouteArgs{key: $key, email: $email, password: $password}';
  }
}

/// generated route for
/// [_i10.SignupScreen]
class SignupRoute extends _i12.PageRouteInfo<void> {
  const SignupRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignupSubDetailsScreen]
class SignupSubDetailsRoute
    extends _i12.PageRouteInfo<SignupSubDetailsRouteArgs> {
  SignupSubDetailsRoute({
    _i13.Key? key,
    required String email,
    required String name,
    required String mobile,
    required String dob,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SignupSubDetailsRoute.name,
          args: SignupSubDetailsRouteArgs(
            key: key,
            email: email,
            name: name,
            mobile: mobile,
            dob: dob,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupSubDetailsRoute';

  static const _i12.PageInfo<SignupSubDetailsRouteArgs> page =
      _i12.PageInfo<SignupSubDetailsRouteArgs>(name);
}

class SignupSubDetailsRouteArgs {
  const SignupSubDetailsRouteArgs({
    this.key,
    required this.email,
    required this.name,
    required this.mobile,
    required this.dob,
  });

  final _i13.Key? key;

  final String email;

  final String name;

  final String mobile;

  final String dob;

  @override
  String toString() {
    return 'SignupSubDetailsRouteArgs{key: $key, email: $email, name: $name, mobile: $mobile, dob: $dob}';
  }
}
