import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        ChallengesRoute(),
        QndaRoute(),
        LearnRoute(),
        ProfileRoute()
      ],

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Color.fromRGBO(235, 237, 240, 1),
            unselectedItemColor: Color.fromRGBO(217, 217, 217, 1),
            items: [
              BottomNavigationBarItem(icon: Image.asset("assets/images/challenges.png"), label: ""),
              BottomNavigationBarItem(icon: Image.asset("assets/images/questions.png"), label: ""),
              BottomNavigationBarItem(icon: Image.asset("assets/images/learning.png"), label: ""),
              BottomNavigationBarItem(icon: Image.asset("assets/images/profile.png"), label: ""),
          ]),
        );
      },
    );
  }
}