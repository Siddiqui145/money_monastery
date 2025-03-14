import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(
            top: 55, left: 16, right: 16
          ),
          child : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
             Center(child: Image.asset("assets/images/challenges_img.png")),
             const SizedBox(
              height: 20,
             ),
             Center(
               child: Text('August Monthly Challenge',
               style: Theme.of(context).textTheme.bodyLarge,),
             ),
              const SizedBox(
              height: 20,
             ),
             Text("Objective: ",
             style: Theme.of(context).textTheme.titleMedium,
             textAlign: TextAlign.start,),
             
             Text("Invest ₹20,000 paper money in 3 stocks of your choice. At the end of 1 month, we'll calculate the percentage return on your portfolio.",
             style: Theme.of(context).textTheme.bodySmall,),
            
              const SizedBox(
              height: 20,
             ),
             Text("How to Participate: ",
             style: Theme.of(context).textTheme.titleMedium,
             textAlign: TextAlign.start,),
             
             Text("1. Choose any 3 stocks from the stock market. 2. Allocate the ₹20,000 among the 3 stocks (in any proportion). 3. Track your portfolio for 1 month. 4. After 1 month, we will calculate the percentage return on your initial investment based on stock prices.",
             style: Theme.of(context).textTheme.bodySmall,),
            
              const SizedBox(
              height: 20,
             ),
             Text("Prize ",
             style: Theme.of(context).textTheme.titleMedium,
             textAlign: TextAlign.start,),
             
             Text("Grand Prize: A free trip to Goa for the winner with the highest percentage return!",
             style: Theme.of(context).textTheme.bodySmall,),
                    ],
            ),
          ),
      ),
    );
  }
}