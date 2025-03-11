import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/data/network/router/app_router.gr.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_button.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_search_text_field.dart';

@RoutePage()
class QndaScreen extends StatefulWidget {
  const QndaScreen({super.key});

  @override
  State<QndaScreen> createState() => _QndaScreenState();
}

class _QndaScreenState extends State<QndaScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        SearchRoute(),
        PostQuestionRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        int currentIndex = tabsRouter.activeIndex;

        return Scaffold(
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
        
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: 'Search a Question',
                        backgroundColor: currentIndex == 0 ? Colors.white70 : Colors.white24,
                        onPressed: () {
                          if(currentIndex != 0) {
                            tabsRouter.setActiveIndex(0);
                            setState(() {});
                          }
                        }
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        title: 'Post a Question',
                        backgroundColor: currentIndex == 0 ? Colors.white24 : Colors.white70,
                        
                        onPressed: () {
                          if (currentIndex != 1) {
                          tabsRouter.setActiveIndex(1);
                          setState(() {}); 
                        }
                        }
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomSearchTextField(controller: searchController),
                ),
                Expanded(child: child),
                ],
            ),
          
        );
      },
      
    );
  }
}