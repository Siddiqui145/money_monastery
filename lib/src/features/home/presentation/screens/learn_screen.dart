import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:money_monastery/src/features/home/presentation/widgets/custom_square_button.dart';

@RoutePage()
class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 35, left: 18, right: 18),
        child: Column(
          children: [
            const SizedBox(height: 25,),
            Text("Learn",
            style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSquareButton(color: Colors.purple.shade100, text: "Fundamental Analysis ", onPressed: () {}),
                const SizedBox(width: 50,),
                CustomSquareButton(color: Colors.yellow.shade200, text: "Technical Analysis ", onPressed: () {}),
              ],
            ),

            const SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSquareButton(color: Colors.pink.shade100, text: "Candlestick Patterns ", onPressed: () {}),
                const SizedBox(width: 50,),
                CustomSquareButton(color: Colors.green.shade200, text: "Taxation", onPressed: () {}),
              ],
            ),

            const SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSquareButton(color: Colors.lightGreen.shade100, text: "Insurance", onPressed: () {}),
                const SizedBox(width: 50,),
                CustomSquareButton(color: Colors.orange.shade200, text: "Mutual Funds", onPressed: () {}),
              ],
            ),
          ],
        ),),
      ),
    );
  }
}