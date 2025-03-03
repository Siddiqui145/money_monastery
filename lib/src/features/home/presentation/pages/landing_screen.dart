import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/money_monastery.png'),
          const SizedBox(height: 10,),
          Text('Your Gateway to Financial Nirvana!',
          style: Theme.of(context).textTheme.titleSmall,),

          const Spacer(),
        ],
      ),
    );
  }
}