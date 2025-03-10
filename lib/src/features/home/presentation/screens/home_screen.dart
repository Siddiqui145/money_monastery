import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/bottom_bar_item.dart';

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
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            backgroundColor: Colors.grey.shade400, 
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: Colors.black, 
            unselectedItemColor: Colors.grey.shade700, 
            items: [
              BottomNavigationBarItem(
                icon: buildFullBox("assets/images/challenges.png", 0, tabsRouter),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: buildFullBox("assets/images/questions.png", 1, tabsRouter),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: buildFullBox("assets/images/learning.png", 2, tabsRouter),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: buildFullBox("assets/images/profile.png", 3, tabsRouter),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}