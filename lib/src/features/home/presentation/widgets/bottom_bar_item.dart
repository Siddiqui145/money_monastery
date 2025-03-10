import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Widget buildFullBox(String asset, int index, TabsRouter tabsRouter) {
    bool isActive = tabsRouter.activeIndex == index;

    return Container(
      width: double.infinity, 
      height: 80, 
      color: isActive ? Colors.white54 : Colors.transparent, 
      child: Center(
        child: Image.asset(
          asset,
          color: isActive ? Colors.black : Colors.grey.shade700, 
        ),
      ),
    );
  }

