import 'package:auto_route/auto_route.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [

    AutoRoute(page: HomeRoute.page, initial: true, 
    children: [
        //AutoRoute(page: HomeRoute.page),
        AutoRoute(page: QndaRoute.page),
        AutoRoute(page: ChallengesRoute.page),
        AutoRoute(page: LearnRoute.page),
        AutoRoute(page: ProfileRoute.page)
    ]),

    AutoRoute(page: LandingRoute.page),
    
  ];
}