import 'package:auto_route/auto_route.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LandingRoute.page),
    AutoRoute(page: QndaRoute.page)
  ];
}